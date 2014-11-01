controllersModule = require './_index'

# ---
# @ngInject
# ---

MainCtrl = ($scope, ProjectService) ->

  vm = @

  vm.title = 'This is a running app now...'

  # Load project data
  ProjectService.get().then (projects) ->
    vm.works = projects

  return vm

# ---
# Add to the module
# ---
controllersModule.controller 'MainCtrl', MainCtrl