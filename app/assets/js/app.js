var API_URL = "http://" + window.location.hostname + "/api/v1";

var app = angular.module('auroragram',['ui.router', 'ngResource', 'relativeDate', 'google-maps'.ns()]);

app.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider
    .state('feed', {
      url: '/',
      templateUrl: 'templates/feed.html',
      authenticate: false
    });

    $urlRouterProvider.otherwise('/');

});

app.run(function($rootScope, $templateCache, $http, $state) {

  //Disable template caching (TODO: make this environment sensitive)
  $rootScope.$on('$viewContentLoaded', function() {
    $templateCache.removeAll();
  });

  $rootScope.map = {
    center: {
        latitude: 45,
        longitude: -73
    },
    zoom: 8
  };

});

/*
* CONTROLLERS
*/

app.controller('FeedController', function($scope, $state, feedService) {

  $scope.feed = null;

  feedService.getFeed().success(function(feed) {
    $scope.feed = feed;
  });

});

app.factory('feedService', function($http){
  var factory = {};

  factory.getFeed = function() {
      return $http.get(API_URL + '/feed');
  };

  return factory;
});
