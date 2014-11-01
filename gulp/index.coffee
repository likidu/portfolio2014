fs = require 'fs'
onlyScripts = require './utils/scriptFilter'
tasks = fs.readdirSync('./gulp/tasks/').filter(onlyScripts)

for task in tasks
  require './tasks/' + task
