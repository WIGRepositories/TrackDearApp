/// <reference path="angular.js" />

angular.module('plunker', ['ui.bootstrap', 'ngMap']).controller('ModalDemoCtrl', function ($scope, $modal, $log) {

    //$scope.geopos = {lat:51.50722,lng:-0.12750};

    $scope.geopos = { lat: 17.3850, lng: 78.4867 };
    $scope.open = function (size) {

        var modalInstance = $modal.open({
            templateUrl: 'myModalContent.html',
            controller: 'ModalInstanceCtrl',
            size: size,
            scope: $scope,
            resolve: {
                lat: function () {
                    return $scope.geopos.lat;
                },
                lng: function () {
                    return $scope.geopos.lng;
                }
            }
        });

        modalInstance.result.then(function (selectedItem) {
        }, function () {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };
});

// Please note that $modalInstance represents a modal window (instance) dependency.
// It is not the same as the $modal service used above.

angular.module('plunker').controller('ModalInstanceCtrl', function ($scope, $modalInstance, $http, lat, lng) {

    $scope.geopos.lat = lat;
    $scope.geopos.lng = lng;

    $scope.render = true;
    $scope.validation_text = "";

    $scope.$on('mapInitialized', function (evt, evtMap) {
        $scope.map = evtMap;
        $scope.marker = new google.maps.Marker({ position: evt.latLng, map: $scope.map });
        $scope.click = function (evt) {
            var latitude = evt.latLng.lat().toPrecision(8);
            var longitude = evt.latLng.lng().toPrecision(8);
            $scope.validation_text = "";
            $scope.marker.setPosition(evt.latLng);
            $scope.map.panTo(evt.latLng);
            $scope.map.setZoom(10);
            $scope.geopos.lat = latitude;
            $scope.geopos.lng = longitude;
        }
    });

    $scope.ok = function () {
        $modalInstance.close();
    };


    $scope.SaveDataUsingPost = function () {
        var selchild = {
            Latitude: $scope.geopos.lat,
            Longitude: $scope.geopos.lng
        }
        var selchild = {
            flag: 'i',
            Latitude: $scope.geopos.lat,
            Longitude: $scope.geopos.lng
        }

        var req = {
            method: 'Post',
            url: '/api/Tracking/PostGoogleLatLng',
            data: selchild
        }

        $http(req).then(function (response) {
            alert("save successfully!!");
        },
        function (errres) {
            alert(errres.data);
        });
    }

});