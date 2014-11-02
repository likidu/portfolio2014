directivesModule = require './_index'

skrollrCss = require 'skrollr-css'
skrollr = require 'skrollr'

# ---
# @ngInject
# ---
skrollrArea = ->
  restrict: 'EA'
  link: ->
    skrollrStylesheets.applyKeyframeAttributes()
    skrollr.init forceHeight: false

# ---
# Add to the module
# ---
directivesModule.directive 'skrollrArea', skrollrArea