app.controller('ShowFriendsCtrl', ['$scope', '$resource', '$http', function($scope, $resource, $http) {
    $scope.friends = [];
    $scope.showFriends = function() {
        $http.get('/users/showFriends?username=' + $scope.username).success(function(data) {
            $scope.friends = data;
        });
    }
}]);