exports.config = {
  framework: 'jasmine2',
  specs: ['spec/*'],
  capabilities: {
    'browserName': 'firefox'
  },
  directConnect: true,
  jasmineNodeOpts: {
    isVerbose: false,
    showColors: true,
    includeStackTrace: true,
    defaultTimeoutInterval: 3000,
    print: function() {}
  },
  onPrepare: function() {
    var SpecReporter;
    SpecReporter = require('jasmine-spec-reporter');
    return jasmine.getEnv().addReporter(new SpecReporter({
      displayStacktrace: true
    }));
  },
  includeStackTrace: true
};
