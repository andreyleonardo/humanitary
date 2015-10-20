app.controller("FormCtrl", [ '$scope', '$state', '$stateParams', '$http', '$modal', '$window',
function($scope, $state, $stateParams, $http, $modal, $window){

	$scope.presenceList = [{address: null, activity: null}];

	$scope.addPresence = function() {
		$scope.presenceList.push({address: null, activity: null});
	};

	$scope.removePresence = function(index) {
		if (index > -1) {
			$scope.presenceList.splice(index, 1);
		}
	};

	$scope.submitForm = function() {
		if ($scope.groupForm.$valid) {

			var obj = { "group": {
								"group_name": $scope.group_name,
								"group_description": $scope.group_description,
								"responsable_name": $scope.responsable_name,
								"group_phone": parseInt($scope.group_phone.replace(/\D/g,'')),
								"addresses_attributes": []
							}
						};

			$scope.presenceList.forEach(function(presence) {

				if(presence.address.address_components &&
					presence.address.address_components.length >= 7) {

						var zip = parseInt(presence.address.address_components[6].long_name.replace(/\D/g,''));

						if (isNaN(zip)) {
							zip = parseInt(presence.address.address_components[7].long_name.replace(/\D/g,''));
						}

						obj.group.addresses_attributes.push({
									"zip": zip,
									"activity": presence.activity,
									"longitude": presence.address.geometry.location.lng(),
									"latitude": presence.address.geometry.location.lat()
						});
					} else {
						obj.group.addresses_attributes.push({
									"activity": presence.activity,
									"longitude": presence.address.geometry.location.lng(),
									"latitude": presence.address.geometry.location.lat()
						});
					}
			});

  			// Endpoint call
			$http.post('/humanitary_api/create_group', obj).
				then(function(response) {
					$scope.successModal();
				}, function(response) {
					$scope.errorModal();
				});
		}
	};

	$scope.reloadForm = function() {
		console.log('reload');
		$window.location.reload();
	};


	$scope.errorModal = function () {

		var modalInstance = $modal.open({
			scope: $scope,
			templateUrl: 'error.html',
			controller: 'FormCtrl'
		});

		$scope.close = function(){
			modalInstance.close();
		};
	};

	$scope.successModal = function () {

		var modalInstance = $modal.open({
			scope: $scope,
			templateUrl: 'success.html',
			controller: 'FormCtrl'
		});

		$scope.close = function(){
			modalInstance.close();
			$scope.reloadForm();
		};
	};

}]);
