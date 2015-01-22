app.controller('RegisterCtrl', ['$scope', '$resource', '$http', function($scope, $resource, $http) {

  $scope.userExist = false;

  $scope.userNameValidated = false;

  $scope.validateUser = function() {
    $http.get('/users/get?username=' + $scope.username).success(function(data) {
      $scope.realUser = $scope.username;
      $scope.userNameValidated = true;
      if(data.msg == 'El usuario no existe') {
        $scope.userExist = false;
      } else {
        $scope.userExist = true;
      }
    });
  }

  $scope.disableRegisterButton = function() {
    return ($scope.userExist || $scope.password != $scope.passwordConfirmation ||
    $scope.realName == null || $scope.birthDate == null ||
    $scope.position == null || $scope.username != $scope.realUser);
  }

}]);