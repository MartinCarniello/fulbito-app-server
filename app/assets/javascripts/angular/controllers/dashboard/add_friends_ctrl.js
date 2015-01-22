app.controller('AddFriendsCtrl', ['$scope', '$resource', '$http', function($scope, $resource, $http) {

  $scope.searchFriends = function() {
    $http.get('/users/search?username=' + $scope.usernameToSearch).success(function(data) {
      $scope.friends = data;
    });
  };

  $scope.addFriend = function(userId, friendUsername) {
    $http.get('/users/show?id=' + userId).success(function(data) {
      username = data[0].username;
      
      $http.get('/users/addFriend?username=' + username + '&friend_username=' + friendUsername).success(function(data) {
        $scope.friends.forEach(function(friend, index, array){
          if(friend.username === friendUsername){
            $scope.friends.remove(index);
          }
        });
      });
    });
  };

}]);