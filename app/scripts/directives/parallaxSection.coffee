directivesModule = require './_index'

$ = require 'jquery'

# ---
# @ngInject
# ---
parallaxSection = ($window) ->
  restrict    : 'EA'
  replace     : true
  templateUrl : 'templates/parallaxSection.html'
  link        : (scope, elem, attrs) ->
    # Resize section height
    angular.element $window
    .bind 'resize', ->
      sH = $window.innerHeight
      $('section.project').css 'height', sH + 'px'


# ---
# Add to the module
# ---
directivesModule.directive 'parallaxSection', parallaxSection