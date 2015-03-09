

module.exports = () ->


  @initConfig
    watch:
      files: ['./src/**/*.js', './spec/**/*.js']
      tasks: ['exec:jasmine']

    exec:
      jasmine:
        command: 'jasmine'


    @loadNpmTasks 'grunt-contrib-watch'
    @loadNpmTasks 'grunt-exec'

