<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- CSRF Token -->
	<meta name="csrf-token" content="{{ csrf_token() }}">

	<title>Portal Berita A</title>

	<!-- Fonts -->
	<link rel="dns-prefetch" href="//fonts.bunny.net">
	<link href="https://fonts.bunny.net/css?family=Nunito" rel="stylesheet">

	<!-- Scripts -->
	@vite(['resources/sass/app.scss', 'resources/js/app.js'])
	<script src="https://kit.fontawesome.com/0901de813d.js" crossorigin="anonymous"></script>

	<!-- CSS -->
	<link rel="stylesheet" href="{{ asset('css/main.css') }}">
</head>

<body class="bg-alt">
	<div id="app">
		@include('layouts.nav')
		<main class="py-4">
			@yield('content')
		</main>
	</div>
</body>

</html>