gulp = require 'gulp'
plumber = require 'gulp-plumber'
browserify = require 'gulp-browserify'
stylus = require 'gulp-stylus'
concat = require 'gulp-concat'
minify = require 'gulp-minify-css'
rimraf = require 'gulp-rimraf'
livereload = require 'gulp-livereload'
lr = require 'tiny-lr'
nib = require 'nib'

server = lr()

# Dev / Prod switch
environment = 'development'

paths =
  src: './app/'
  dest: './public/'
  vendor: './vendor/'
  assets: './assets/'


# Assets task
gulp.task 'assets', ->
  gulp.src paths.assets + '**'
    .pipe gulp.dest paths.dest + 'assets/'
    .pipe livereload server


# Script task
gulp.task 'scripts', ->
  stream = gulp.src paths.src + 'scripts/main.coffee', { read: false}
    .pipe plumber()
    .pipe browserify
      debug: environment is 'development'
      transform: ['coffeeify']
      extensions: ['.coffee']
    .pipe concat 'main.js'

  if environment is 'production'
    stream.pipe uglify()

  stream.pipe gulp.dest paths.dest + 'js/'
    .pipe livereload server


# Stylus task
gulp.task 'styles', ->
  stream = gulp.src paths.src + 'styles/**/*.styl'
    .pipe plumber()
    .pipe stylus
      use: nib()

  if environment is 'production'
    stream.pipe minify()

  stream.pipe gulp.dest paths.dest + 'css/'
    .pipe livereload server


# HTML task
gulp.task 'html', ->
  gulp.src paths.src + 'index.html'
    .pipe plumber()
    .pipe gulp.dest paths.dest
    .pipe livereload server

  # Copy views
  gulp.src paths.src + 'views/**/*.html'
    .pipe plumber()
    .pipe gulp.dest paths.dest + 'views/'
    .pipe livereload server


# Clean task
gulp.task 'clean', ->
  gulp.src paths.dest + 'views/', { read: false } # Much faster
    .pipe rimraf { force: true }


# Vendors scripts task
gulp.task 'vendor-scripts', ->
  stream = gulp.src [
    paths.vendor + 'scripts/angular.js'
  ]
    .pipe plumber()
    .pipe concat 'vendor.js'

  if environment is 'production'
    stream.pipe uglify()

  stream.pipe gulp.dest paths.dest + 'js/'


# Vendors styles task
gulp.task 'vendor-styles', ->
  stream = gulp.src paths.vendor + 'styles/**/*.*'
    .pipe plumber()
    .pipe concat 'vendor.css'

  if environment is 'production'
    stream.pipe minify()

  stream.pipe gulp.dest paths.dest + 'css/'


# Watch
gulp.task 'watch', ->
  # Listen to tiny-lr notification
  server.listen 35729, (err) ->
    if err
      console.log err
      return true

    gulp.watch paths.src + 'scripts/**/*.coffee', ['scripts']
    gulp.watch paths.src + 'styles/**/*.styl', ['styles']
    gulp.watch [paths.src + 'index.html', paths.src + 'views/**/*.html'], ['html']


# Helper tasks
gulp.task 'vendor', ['vendor-scripts', 'vendor-styles']

gulp.task 'compile', ['scripts', 'styles', 'html']
gulp.task 'default', ['assets', 'vendor', 'compile']