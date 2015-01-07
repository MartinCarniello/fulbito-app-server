app.controller('RegisterCtrl', ['$scope', '$resource', '$http', function($scope, $resource, $http) {
    $scope.positions = [
                        "arquero",
                        "def lateral", "def central",
                        "med defensivo", "med lateral", "med ofensivo",
                        "del central", "del lateral"
                       ];

    $scope.userExist = true;

    $scope.validateUser = function() {
        $http.get('/users/show?username=' + $scope.username).success(function(data) {
            $scope.realUser = $scope.username;
            if(data.msg == 'El usuario no existe') {
                $scope.userExist = false;
            } else {
                $scope.userExist = true;
            }
        });
    }

    $scope.register = function() {
        $http.get('/users/new?username=' + $scope.username + '&password=' + $scope.password +
                '&real_name=' + $scope.realName + '&birth_date=' + $scope.birthDate +
                '&position=' + $scope.position).success(function(data) {
            $scope.msg = data;
        });
    }
}]);