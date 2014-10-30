directivesModule = require './_index'

# ---
# @ngInject
# ---
skrollor = ->
  restrict: 'EA'
  link: ->
    skrollr.init
      forceHeight: false

# ---
# Add to the module
# ---
directivesModule.directive 'skrollor', skrollor