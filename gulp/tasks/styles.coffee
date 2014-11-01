config = require '../config'
gulp = require 'gulp'
gulpif = require 'gulp-if'
stylus = require 'gulp-stylus'
handleErrors = require '../utils/handleErrors'
browserSync = require 'browser-sync'
nib = require 'nib'

gulp.task 'styles', ->
  gulp.src config.styles.src
    .pipe stylus use: nib()
    .on 'error', handleErrors
    .pipe gulp.dest config.styles.dest
    .pipe gulpif browserSync.active, browserSync.reload stream: true
