gulp = require 'gulp'
runSequence = require 'run-sequence'

gulp.task 'dev', ['clean'], (cb) ->
  cb = cb or -> {}

  global.isProd = false

  runSequence 'styles', 'vendorStyles', 'images', 'fonts', 'json', 'views', 'browserify', 'watch', cb
