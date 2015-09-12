app.controller("MainCtrl", [ '$scope', '$state', '$stateParams', '$http',
function($scope, $state, $stateParams, $http){
	
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
								"group_phone": parseInt($scope.group_phone),
								"group_description": $scope.group_description,
								"addresses_attributes": []
							}
						},
				zip = 0;

			$scope.presenceList.forEach(function(presence) {

				zip = 0;

				if(presence.address.address_components && 
				   presence.address.address_components.length >= 7) {
					zip = parseInt(presence.address.address_components[6].long_name.replace(/\D/g,''))
				}

				obj.group.addresses_attributes.push({
									"zip": zip,
									"activity": presence.activity,
									"longitude":presence.address.geometry.location.K,
									"latitude":presence.address.geometry.location.G
				                });
			});
  			
  			// Endpoint call
			$http.post('/humanitary_api/create_group', obj). 
				then(function(response) {
					alert('Criado com sucesso!');
				}, function(response) {
					alert('Erro!');
					console.log(response);
				});
		}
	};

}]);