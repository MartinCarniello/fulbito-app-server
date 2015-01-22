app.controller('NavigatorCtrl', ['$scope', '$resource', '$http', function($scope, $resource, $http) {

  $scope.navOption = 0;

  $scope.home = function($event) {
    $event.preventDefault();
    $scope.navOption = 0;
  };

  $scope.friends = function($event) {
    $event.preventDefault();
    $scope.navOption = 1;
  };

  $scope.matchs = function($event) {
    $event.preventDefault();
    $scope.navOption = 2;
  };

  $scope.tournament = function($event) {
    $event.preventDefault();
    $scope.navOption = 3;
  };

}]);