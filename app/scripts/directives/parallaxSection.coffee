directivesModule = require './_index'

# ---
# @ngInject
# ---
parallaxSection = ->
  restrict: 'E'
  templateUrl: 'templates/parallaxSection.html'
  link: (scope, elem) ->


# ---
# Add to the module
# ---
directivesModule.directive 'parallaxSection', parallaxSection