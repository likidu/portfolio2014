config = require '../config'
gulp = require 'gulp'
gulpif = require 'gulp-if'
changed = require 'gulp-changed'
browserSync = require 'browser-sync'

gulp.task 'json', ->
  dest = config.jsons.dest

  gulp.src config.jsons.src
  .pipe changed dest # Ignore unchanged files
  .pipe gulp.dest dest
  .pipe gulpif browserSync.active, browserSync.reload stream: true