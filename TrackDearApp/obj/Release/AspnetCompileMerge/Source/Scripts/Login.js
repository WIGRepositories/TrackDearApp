﻿var myapp1 = angular.module('myApp', ['ngStorage', 'ngAnimate', 'treasure-overlay-spinner', 'ui.bootstrap'])
//var myapp1 = angular.module('myApp', ['ngStorage'])

var myCtrl = myapp1.controller('myCtrl', function ($scope, $http, $localStorage, $rootScope, $uibModal) {

    $rootScope.spinner = {
        active: false,
        on: function () {
            this.active = true;
        },
        off: function () {
            this.active = false;
        }
    }

    $scope.save = function (type) {

        var type = {

            UserName: type.UserName,
            oldPassword: type.oldPassword,
            newPassword: type.newPassword,
            reenternewPassword: type.reenternewPassword,

        };

        var req = {
            method: 'POST',
            url: '/api/UserLogins/ResetPassword',
            //headers: {
            //    'Content-Type': undefined
            data: type
        }
        $http(req).then(function (response) {

        })
    }



    $scope.Signin = function () {

        var u = $scope.UserName;
        var p = $scope.Password

        if (u == null || u == "") {
            $scope.showDialog("Please enter username");
            // alert('Please enter username');
            return;
        }

        if (p == null || p == "") {
            $scope.showDialog("Please enter password");
            //alert('Please enter password');
            return;
        }

        var inputcred = { LoginInfo: u, Passkey: p }


        var req = {
            method: 'POST',
            url: '/api/Login/ValidateCredentials',
            data: inputcred
        }
        $rootScope.spinner.on();
        //  angular.element('body').addClass('spinnerOn'); // add Class to body to show spinner


        $http(req).then(function (res) {

            if (res.data.length == 0) {
                $rootScope.spinner.off();
                //  $rootScope.$apply();
                //angular.element('body').removeClass('spinnerOn').then(function () { alert('invalid credentials'); }); // hide spinner
                // alert('invalid credentials');
                $scope.showDialog("invalid credentials");
            }
            else {
                //if the user has role, then get the details and save in session
                $localStorage.uname = res.data[0].uname;
                $localStorage.userdetails = res.data;
                var roleid = $localStorage.userdetails[0].roleid;
                switch (roleid) {


                    case 1:
                        window.location.href = "index.html";
                        break;
                    case 2:
                        window.location.href = "Index_finAdmin.html";
                        break;


                    case 3:
                        window.location.href = "Index_support.html";
                        break;
                    case 4:
                        window.location.href = "Index_help.html";
                        break;
                    case 5:
                        window.location.href = "Index_sales.html";
                        break;
                    case 6:
                        window.location.href = "Index_FO.html";
                        break;
                    case 11:
                        window.location.href = "Index_G.html";
                        break;
                    case 12:
                        window.location.href = "Index_cmpUser.html";
                        break;
                    default:
                        window.location.href = "index.html";
                        break;

                }

            }
        },//error
        function (res) {
            $rootScope.spinner.off();
            //  $rootScope.$apply();
            //angular.element('body').removeClass('spinnerOn'); // hide spinner
        });
    }

    $scope.showDialog = function (message) {

        var modalInstance = $uibModal.open({
            animation: $scope.animationsEnabled,
            backdrop: false,
            templateUrl: 'myModalContent.html',
            controller: 'ModalInstanceCtrl',
            resolve: {
                mssg: function () {
                    return message;
                }
            }
        });
    }
});

myapp1.controller('ModalInstanceCtrl', function ($scope, $uibModalInstance, mssg) {

    $scope.mssg = mssg;
    $scope.ok = function () {

        $uibModalInstance.close();
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});