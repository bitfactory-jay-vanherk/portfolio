ifneq ("$(wildcard ./.env)","")
	include .env
endif

.PHONY: build install up down reload npm npm-install npx certificates certificates-login manual-message

build:
	docker-compose build --pull

install:
	@find ~/.bitfactory/traefik/tls.yaml -mmin +1440 -exec make certificate-login \;
	make certificates
	make npm-install
	make manual-message

# Nuxt container is run non-daemonized on purpose to be able to see the terminal output (e.g. HMR/HR).
up:
	@echo "\n\033[0;31mUse '\033[0;33mCTRL-C\033[0;31m' to quit the running Nuxt container.\033[0m\n"
	@find ~/.bitfactory/traefik/tls.yaml -mmin +1440 -exec make certificate-login \;
	@find ~/.bitfactory/traefik/tls/${APP_DOMAIN}.crt -mmin +1440 -exec make certificates \;
	docker-compose up nuxt

down:
	docker-compose down

reload: down up

npm:
	docker-compose run --rm node npm $(filter-out $@,$(MAKECMDGOALS))

npm-install:
	docker-compose run --rm node npm install --save-exact $(filter-out $@,$(MAKECMDGOALS))

npx:
	docker-compose run --rm node npx $(filter-out $@,$(MAKECMDGOALS))

certificates:
	vault write pki-dev-docker/issue/certificate common_name="${APP_DOMAIN}" alt_names="${DASHBOARD_DOMAIN}" -format=json > ~/.bitfactory/traefik/tls/${APP_DOMAIN}.json
	cat ~/.bitfactory/traefik/tls/${APP_DOMAIN}.json | jq -r '.data.private_key' > ~/.bitfactory/traefik/tls/${APP_DOMAIN}.key
	cat ~/.bitfactory/traefik/tls/${APP_DOMAIN}.json | jq -r '.data.certificate,.data.ca_chain[]' > ~/.bitfactory/traefik/tls/${APP_DOMAIN}.crt
	grep -q "${APP_DOMAIN}" ~/.bitfactory/traefik/tls.yaml || \
			echo "\n    - certFile: /etc/traefik/bitfactory/tls/${APP_DOMAIN}.crt\n      keyFile: /etc/traefik/bitfactory/tls/${APP_DOMAIN}.key\n" \
			>> ~/.bitfactory/traefik/tls.yaml

certificate-login:
	vault login -method=oidc
	touch ~/.bitfactory/traefik/tls.yaml

manual-message:
	@echo "\n\033[0;31mAfter running '\033[0;33mmake up\033[0;31m' the machine is up and ready at the following domains:\033\n"
	@echo "\033[0;36m$(APP_URL)\033[0;32m\033[0m"
	@echo "\033[0;36m$(DASHBOARD_URL)\033[0;32m\033[0m"
	@echo "\n\033[0;31mYou can also run the following commands:\033[0m"
	@echo "\033[0;31m - '\033[0;33mmake npm-install \"<package> [--save-dev]\"\033[0;31m' to install a npm package.\033[0m"
	@echo "\033[0;31m - '\033[0;33mmake npm run <command>\033[0;31m' to do other npm run commands (e.g \033[0;33mmake npm run eslint:fix\033[0;31m).\033[0m"
	@echo "\033[0;31m - '\033[0;33mmake npm ci [--silent]\033[0;31m' to do a (silent) npm clean install.\033[0m"
	@echo "\033[0;31m - '\033[0;33mmake npx <package>\033[0;31m' to run a npx command.\033[0m"
	@echo "\033[0;31mSee the Makefile for other commands.\033[0m\n"

%: # fallback rule which will match any task name
	@: # empty recipe = do nothing

