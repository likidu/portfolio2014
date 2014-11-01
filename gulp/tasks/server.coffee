config = require '../config'
express = require 'express'
gulp = require 'gulp'
morgan = require 'morgan'

gulp.task 'server', ->
  server = express()

  # Log all requests to the console
  server.use morgan 'dev'
  server.use express.static config.dist.root

  # Serve index.html for all routes to leave routing up to Angular
  server.all '/*', (req, res) ->
    res.sendFile 'index.html', root: 'public'

  # Start web server
  server.listen config.serverport
