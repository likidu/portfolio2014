notify = require 'gulp-notify'

module.exports = (error) ->
  if not global.isProd
    args = Array.prototype.slice.call arguments

    # Send error to notification center with gulp-notify
    notify.onError(
      title: 'Compile Error'
      message: "<%= error.message %>"
    ).apply @, args

    # Keep gulp from hanging on this task
    @emit 'end'

  else
    # Log the error and stop the process to prevent broken code from building
    console.log error
    process.exit 1
