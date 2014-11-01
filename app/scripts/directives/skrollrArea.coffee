directivesModule = require './_index'

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