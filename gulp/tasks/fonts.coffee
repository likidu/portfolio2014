config = require '../config'
gulp = require 'gulp'

gulp.task 'fonts', ->

  gulp.src config.fonts.src
  .pipe gulp.dest config.fonts.dest