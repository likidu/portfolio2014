controllersModule = require './_index'

# ---
# @ngInject
# ---

MainCtrl = ($scope, ProjectService) ->

  $scope.title = 'This is a running app now...'

  # Load project data
  ProjectService.get().then (projects) ->
    $scope.works = projects

    console.log $scope.works


# ---
# Add to the module
# ---
controllersModule.controller 'MainCtrl', MainCtrl