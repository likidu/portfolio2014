config = require '../config'
gulp = require 'gulp'
gulpif = require 'gulp-if'
gutil = require 'gulp-util'
source = require 'vinyl-source-stream'
streamify = require 'gulp-streamify'
watchify = require 'watchify'
browserify = require 'browserify'
uglify = require 'gulp-uglify'
handleErrors = require '../utils/handleErrors'
browserSync = require 'browser-sync'
coffeeify = require 'coffeeify'
ngAnnotate = require 'browserify-ngannotate'


buildScript = (file) ->

  # Create a separate vendor bundler that will only run when starting gulp
  vendorBundler = browserify
    debug : false

  # Iterate external list to add required libs
  for external in config.externals
    if external.expose?
      vendorBundler.require external.require, expose : external.expose
    else
      vendorBundler.require external.require

#  vendorBundler.require './vendor/scripts/skrollr-css.js', expose: 'skrollr-css'

  # Application bundler
  bundler = browserify
    entries      : config.browserify.entries
    extensions   : ['.coffee']
    debug        : true # Source map
    cache        : {}
    packageCache : {}
    fullPaths    : true

  if not global.isProd
    bundler = watchify bundler
    bundler.on 'update', -> rebundle()

  # Enable Coffeescript and prepare for Angular minification with ng-annotate
  bundler.transform [coffeeify, ngAnnotate]

  # Externalize libs
  bundler.external config.externals.map (external) -> external.expose

  rebundle = ->
    stream = bundler.bundle()

    gutil.log 'Rebundle...'

    stream.on 'error', handleErrors
    .pipe source file
    .pipe gulpif global.isProd, streamify uglify()
    .pipe gulp.dest config.scripts.dest
    .pipe browserSync.reload
      stream : true
      once   : true


  vendorBundler.bundle()
  .pipe source 'vendor.js'
  .pipe gulpif global.isProd, streamify uglify()
  .pipe gulp.dest config.scripts.dest
  .pipe browserSync.reload
    stream : true
    once   : true


  return rebundle()

gulp.task 'browserify', ->
  buildScript config.browserify.bundleName
