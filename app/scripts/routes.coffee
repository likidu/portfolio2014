# ---
# @ngInject
# ---
Routes = ($stateProvider, $locationProvider, $urlRouterProvider) ->

  $locationProvider.html5Mode false

  $stateProvider
    .state 'home',
      url: '/'
      controller: 'MainCtrl as home'
      templateUrl: 'home.html'
      title: 'Home'

  $urlRouterProvider.otherwise '/'

module.exports = Routes