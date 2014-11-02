module.exports =
  serverport : 3000

  scripts :
    src  : 'app/scripts/**/*.coffee'
    dest : 'public/js'

  styles :
    main : 'app/styles/main.styl'
    src  : 'app/styles/**/*.styl'
    dest : 'public/css'

  views :
    src  : [
      'app/views/**/*.html'
    ]
#    dest : 'public/views'
    dest : 'app/scripts'

  images :
    src  : 'assets/images/**/*'
    dest : 'public/assets/images'

  vendorScripts :
    src : 'vendor/scripts/**/*.js'
    dest: 'public/js'

  vendorStyles :
    src  : 'vendor/styles/**/*.css'
    dest : 'public/css'

  fonts :
    src  : 'assets/fonts/**/*'
    dest : 'public/assets/fonts'

  jsons :
    src  : 'assets/mockJson/*.json'
    dest : 'public/assets/json'

  externals : [
    {require : 'angular', expose : 'angular'}
    {require : 'angular-ui-router', expose : 'angular-ui-router'}
    {require : 'jquery', expose : 'jquery'}
    {require : './vendor/scripts/skrollr-css', expose : 'skrollr-css'}
    {require : './vendor/scripts/skrollr', expose : 'skrollr'}
  ]

  dist :
    root : 'public'

  browserify :
    entries    : ['./app/scripts/main.coffee']
    bundleName : 'main.js'
    vendorName : 'vendor.js'
