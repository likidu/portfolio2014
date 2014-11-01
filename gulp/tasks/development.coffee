gulp = require 'gulp'
runSequence = require 'run-sequence'

gulp.task 'dev', ['clean'], (cb) ->
  cb = cb or -> {}

  global.isProd = false

  runSequence 'styles', 'views', 'browserify', 'watch', cb
#  runSequence('styles', 'images', 'views', 'browserify', 'watch', cb);
