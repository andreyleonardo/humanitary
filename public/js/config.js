app.config(['$locationProvider','$stateProvider', '$urlRouterProvider',
 function($locationProvider, $stateProvider, $urlRouterProvider) {

	$stateProvider
		.state('home', {
			url: '/',
			templateUrl: '/home.html',
			controller: 'MainCtrl'
		});

	$urlRouterProvider.otherwise('/');

	
}]);