angular = require 'angular'

# Angular modules
require './controllers/_index'

# Create Angular module and bind its requires
app = angular.module 'works2014', []

app.requires = [
  'app.controllers'
]


# Create and bootstrap application
angular.element document
  .ready ->
    angular.bootstrap document, ['works2014']