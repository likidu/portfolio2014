config = require '../config'
gulp = require 'gulp'
gulpif = require 'gulp-if'
concat = require 'gulp-concat'
minify = require 'gulp-minify-css'

gulp.task 'vendorStyles', ->
  gulp.src config.vendorStyles.src
    .pipe concat 'vendor.css'
    .pipe gulpif global.isProd, minify
    .pipe gulp.dest config.vendorStyles.dest