
var myapp1 = angular.module('myApp', []);
var mycrtl1 = myapp1.controller('myCtrl', function ($scope, $http) {
    $scope.message = 'WelCome to Samba';
    //FOR DDL FILL
    $scope.init = function () {

        $http.get('/api/AddUsers/Supervisor').then(function(res,data)
        {
            $scope.UserNames = res.data;
        }
    )};
    $scope.save = function (type) {

        var type = {
            flag:'I',
            Username: type.Username,
            Email: type.Email,
            Mobilenumber: type.Mobilenumber,
            OwnerId: type.UserName.AuthTypeId
                        
        };

        var req = {
            method: 'POST',
            url: '/api/AddUsers/AddUser',
            //headers: {
            //    'Content-Type': undefined

            data: type
        }
        $http(req).then(function (response) { });
    }
});