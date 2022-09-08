# Build arguments
# ---------------
# - Container tags to use for our base images.
#   By default we use stable tags for release builds.
#   For the development environment this can be overridden in `docker-compose.yaml`.
#   If needed, add the following lines to 'image' -> build section, e.g.:
#   ```
#   build:
#      args:
#        TAG_NODE: "18.2"
#   ```
ARG TAG_NODE=16.15.0-bf0

########
# Node #
########
# Base image
# ----------
FROM europe-docker.pkg.dev/bitfactory-nl/service-node/node:${TAG_NODE} AS node_base
WORKDIR /app

# Development image
# -----------------
FROM node_base AS node_dev
# (nothing extra to do for Node development, but we want to have a logical target name)

## Production image
## -------------
FROM node_base AS node
# (nothing extra to do for Node production, but we want to have a logical target name)

########
# Nuxt #
########
# Base image
# ----------
FROM node_base as nuxt_base
EXPOSE 3000

## Development image
## -----------------
FROM nuxt_base as nuxt_dev
# NOTE: esbuild should be rebuild, else it does not work, see these links as well:
# - https://www.querythreads.com/vite-react-app-esbuild-error-in-docker-container/
# - https://github.com/vitejs/vite/issues/2671#issuecomment-829535806
# This does not work for Nuxt 3 with vite and esbuild: `CMD ["npm", "run", "dev"]`
CMD ["sh","-c", "npm rebuild esbuild && npm run dev"]

## Build image
## -----------
FROM nuxt_base as nuxt_build
COPY / /app/
RUN npm install
RUN npm run build

## Production image
## ----------------
FROM nuxt_base as nuxt
COPY --from=nuxt_build /app/.output /app/.output
CMD ["node", "/app/.output/server/index.mjs"]
