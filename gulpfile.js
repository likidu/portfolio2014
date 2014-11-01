/**
 * Gulpfile
 * Created by liki on 4/5/14.
 */
// Use coffee-script for gulp:
// https://medium.com/majkldevs-notes/4adc5a31c4c5

require('coffee-script/register');

//var gutil = require('gulp-util');

// Set production or development tag
global.isProd = false

// Specify the gulp config in coffee-script placed.
//var gulpfile = './gulp-old.coffee';
//gutil.log('Using coffee version gulpfile', gutil.colors.magenta(gulpfile));

// Execute coffee-script config file.
//require(gulpfile);
require('./gulp');