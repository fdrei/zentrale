# file: Gulpfile.coffee

gulp = require 'gulp'
downloadatomshell = require 'gulp-download-atom-shell'

atom_shell_output_dir = 'build'

gulp.task 'default', ['downloadatomshell']

gulp.task 'downloadatomshell', (cb)->
  downloadatomshell({
    version: '0.19.5'
    outputDir: atom_shell_output_dir
  }, cb)
