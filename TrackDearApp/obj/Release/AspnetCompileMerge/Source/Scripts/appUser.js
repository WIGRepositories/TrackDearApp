var myapp = angular.module("myApp", []);
myCtrl = myapp.controller('myCtrl', function($scope,$http) {
    $scope.appUser=function() {
        $http.get('/api/AddUsers/GetAppUsers').then(function(res,data) {
            $scope.UserList=res.data;
        }
    )
    };

    $scope.save = function (NewUser) {

        var NewUser = {
            flag: 'I',
            Username: NewUser.Username,
            Email: NewUser.Email,
            Mobilenumber: NewUser.Mobilenumber,
            Password: NewUser.Password,
            Firstname: NewUser.Firstname,
            lastname: NewUser.lastname,
            AuthTypeId: NewUser.AuthTypeId,
            AltPhonenumber: NewUser.AltPhonenumber,
            Altemail: NewUser.Altemail,
            AccountNo: NewUser.AccountNo

        };
        var req = {
            method: 'POST',
            url: '/api/UserAccount/RegisterUser',
            //headers: {
            //    'Content-Type': undefined

            data: NewUser
        }
        $http(req).then(function (response) { });
    };
});
