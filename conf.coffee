exports.config =
  framework: 'jasmine2'
  specs: [ 'spec/*' ]
  capabilities: 'browserName': 'firefox'
  # capabilities: 'browserName': 'phantomjs'
  directConnect: true
  jasmineNodeOpts:
    isVerbose: false
    showColors: true
    includeStackTrace: true
    defaultTimeoutInterval: 3000
    print: ->
  onPrepare: ->
    SpecReporter = require('jasmine-spec-reporter')
    jasmine.getEnv().addReporter new SpecReporter(displayStacktrace: true)
  includeStackTrace: true
