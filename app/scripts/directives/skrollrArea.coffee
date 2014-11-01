directivesModule = require './_index'

skrollrStylesheets = require 'skrollr-stylesheets'
skrollr = require 'skrollr'

# ---
# @ngInject
# ---
skrollrArea = ->
  restrict: 'EA'
  link: ->
    skrollr.init
      forceHeight: false

# ---
# Add to the module
# ---
directivesModule.directive 'skrollrArea', skrollrArea