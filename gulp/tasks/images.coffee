config = require '../config'
gulp = require 'gulp'
gulpif = require 'gulp-if'
changed = require 'gulp-changed'
imagemin = require 'gulp-imagemin'

gulp.task 'images', ->
  dest = config.images.dest

  gulp.src config.images.src
  .pipe changed dest # Ignore unchanged files
  .pipe gulpif global.isProd, imagemin()
  .pipe gulp.dest dest