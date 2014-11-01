config = require '../config'
gulp = require 'gulp'
changed = require 'gulp-changed'

gulp.task 'json', ->
  dest = config.jsons.dest

  gulp.src config.jsons.src
    .pipe changed dest # Ignore unchanged files
    .pipe gulp.dest dest