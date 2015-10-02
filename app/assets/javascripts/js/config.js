app.config(['$locationProvider','$stateProvider', '$urlRouterProvider',
 function($locationProvider, $stateProvider, $urlRouterProvider) {

	$stateProvider
		.state('home', {
			url: '/',
			templateUrl: '/home.html',
			controller: 'MainCtrl'
		})

		.state('form', {
			url: '/form',
			templateUrl: '/form.html',
			controller: 'FormCtrl'
		});

	$urlRouterProvider.otherwise('/');

	
}]);