app.controller("MenuCtrl", [ '$scope', '$rootScope', '$location', '$state', '$stateParams',
function($scope, $rootScope, $location, $state, $stateParams){

	if ($location.path() === "/form") {
		$rootScope.group_form = true;
		$rootScope.home = false;
	} else {
		$rootScope.group_form = false;
		$rootScope.home = true;
	}

	$scope.activate = function(option) {
		if (option === "home") {
			$rootScope.home = true;
			$rootScope.group_form = false;
		} else if (option === "group_form") {
			$rootScope.home = false;
			$rootScope.group_form = true;
		}
	};

}]);