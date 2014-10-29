module.exports = (grunt) ->
  grunt.util.linefeed = '\n'
  
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    copy:
      project:
        files: [
          expand: true
          cwd: 'src/'
          src: ['**/*.js']
          dest: 'build/'
          ext: '.js'
          extDot: 'last'
        ]
    coffee:
      project:
        files: [
          expand: true
          cwd: 'src/'
          src: ['**/*.coffee']
          dest: 'build/'
          ext: '.js'
          extDot: 'last'
        ]
    cson:
      project:
        files: [
          expand: true
          cwd: 'src/'
          src: ['**/*.cson']
          dest: 'build/'
          ext: '.json'
          extDot: 'last'
        ,
          src: 'config.cson'
          dest: 'build/config.json'
        ]
    watch:
      project:
        files: ['src/**/*', 'config.cson']
        tasks: ['copy', 'coffee', 'cson']
  
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-cson'
  grunt.registerTask 'default', ['copy', 'coffee', 'cson']
  grunt.registerTask 'debug', ['copy', 'coffee', 'cson', 'watch']