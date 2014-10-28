controllersModule = require './_index'

# ---
# @ngInject
# ---

MainCtrl = ($scope) ->
  $scope.testVar = "This is a running Angular app, very nice!"

# ---
# Add to the module
# ---
controllersModule.controller 'MainCtrl', MainCtrl