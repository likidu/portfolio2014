controllersModule = require './_index'

# ---
# @ngInject
# ---

MainCtrl = ($scope, ProjectService) ->
  $scope.testVar = ProjectService.get()

# ---
# Add to the module
# ---
controllersModule.controller 'MainCtrl', MainCtrl