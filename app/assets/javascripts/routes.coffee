angular.module('DigApp').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'index',
      url: '/',
      controller: 'DigsCtrl'
      resolve:
        digs: (Dig) ->
          Dig.index()
      templateUrl: '/assets/index.html'

    .state 'dig',
      url: '/dig/:id'
      controller: 'DigCtrl'
      resolve:
        dig: ($stateParams, Dig) ->
          Dig.show($stateParams.id)
      templateUrl: '/assets/dig.html'

