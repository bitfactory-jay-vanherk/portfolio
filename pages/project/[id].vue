<template>
	<div class="container mx-auto w-1/2 py-8">
		<Title>{{ $route.params.id }} | {{ title }}</Title>
		<h3 class="text-3xl font-bold">
			<NuxtLink to="/project/1">Title of project</NuxtLink>
		</h3>
		<div class="project-meta text-gray-700 flex-items-center space-x-2">
			<div>Aug 31, 2022</div>
			<div>&middot;</div>
			<div>Jay van Herk</div>
		</div>
		<div class="project-content mt-4">
			{{ $route.params.id }} Lorem ipsum dolor sit amet, consectetuer adipiscing
			elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque
			penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec
			quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla
			consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec,
			vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis
			vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer
			tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate
			eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae,
			eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat
			a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque
			rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur
			ullamcorper ultricies nisi. Nam eget dui.
		</div>
	</div>
</template>

<script setup>
const title = useState("title");
</script>
