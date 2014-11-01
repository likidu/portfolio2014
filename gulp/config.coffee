module.exports =
  serverport : 3000

  scripts :
    src  : 'app/scripts/**/*.coffee'
    dest : 'public/js'

  styles :
    src  : 'app/styles/**/*.styl'
    dest : 'public/css'

  views :
    src  : [
      'app/views/**/*.html'
    ]
#    dest : 'public/js'
    dest : 'app/scripts'

  externals : [
    {require : 'angular', expose : 'angular'}
    {require : 'angular-ui-router', expose : 'angular-ui-router'}
    {require : 'jquery', expose : 'jquery'}
#    {require : 'vendor/scripts/skrollr', expose : 'skrollr'}
  ]

  vendorScripts :
    src  : 'vendor/scripts/**/*.js'
    dest : ''

  dist :
    root : 'public'

  browserify :
    entries    : ['./app/scripts/main.coffee']
    bundleName : 'main.js'
    vendorName : 'vendor.js'

#module.exports = {
#
#  'serverport': 3000,
#
#
#  'scripts': {
#    'src' : 'app/js/**/*.js',
#    'dest': 'build/js'
#  },
#
#  'images': {
#    'src' : 'app/images/**/*',
#    'dest': 'build/images'
#  },
#
#
#
#};