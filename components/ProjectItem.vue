<template>
	<div class="project-container py-8">
		<h3 class="text-3xl font-bold">
			<NuxtLink :to="`/project/1`">Title of project</NuxtLink>
		</h3>
		<div class="project-meta text-gray-700 flex-items-center space-x-2">
			<div>Aug 31, 2022</div>
			<div>&middot;</div>
			<div>Jay van Herk</div>
		</div>
		<div class="project-preciew loading-relaxed mt-4">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
			tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
			veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
			commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
			velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
			cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
			est laborum
		</div>
		<div class="mt-4">
			<NuxtLink
				:to="`/project/1`"
				class="bg-blue-700 hover:bg-blue-800 text-white rounded inline-block px-4 py-2"
				>Read more</NuxtLink
			>
		</div>
	</div>
</template>
