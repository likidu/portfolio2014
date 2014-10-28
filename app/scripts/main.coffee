angular = require 'angular'

# Angular modules
require 'angular-ui-router'
require './controllers/_index'
require './services/_index'
require './directives/_index'

# Create Angular module and bind its requires
app = angular.module 'works2014', []
# Incl config
angular.module 'works2014'
  .config require './routes'

app.requires = [
  'ui.router',
  'app.controllers',
  'app.services',
  'app.directives'
]


# Create and bootstrap application
angular.element document
  .ready ->
    angular.bootstrap document, ['works2014']