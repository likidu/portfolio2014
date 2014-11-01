path = require 'path'

# ---
# Filters out non .js files. Prevents
# accidental inclusion of possible hidden files
# ---
module.exports = (name) ->
  /(\.(coffee)$)/i.test path.extname name
