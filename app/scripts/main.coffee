angular = require 'angular'

# Angular modules
require 'angular-ui-router'
# Angular templateCache is in Javascript
require './templates.js'
require './controllers/_index'
require './services/_index'
require './directives/_index'

# Create Angular module and bind its requires

requires = [
  'ui.router'
  'templates'
  'app.controllers'
  'app.services'
  'app.directives'
]

app = angular.module 'works2014', requires

# Include config
angular.module 'works2014'
  .config require './routes'

# Create and bootstrap application
angular.element document
  .ready ->
    # Bootstrap Angular app
    angular.bootstrap document, ['works2014']
