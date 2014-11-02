config = require '../config'
gulp = require 'gulp'

gulp.task 'watch', ['browserSync', 'server'], ->
#  gulp.watch config.scripts.src, ['lint', 'browserify']
  # Should also watch manually added libs
  gulp.watch [config.scripts.src, config.vendorScripts.src], ['browserify']
  gulp.watch config.styles.src, ['styles']
  gulp.watch config.images.src, ['images', 'reload']
  gulp.watch ['app/index.html', config.views.src], ['views']
  gulp.watch config.jsons.src, ['json']