executeInFlow = (fn, done) ->
  browser.driver.controlFlow().execute(fn).then (->
    done()
    return
  ), (err) ->
    if err
      console.log 'error: ' + err.message
    return
  return

'use strict'
Yadda = require('yadda')
library = require('../library')
fs = require('fs')
Yadda.plugins.jasmine.StepLevelPlugin.init()
describe 'Integrated bonuses', ->
  new (Yadda.FeatureFileSearch)('features/bonus').each (file) ->
    featureFile file, (feature) ->
      scenarios feature.scenarios, (scenario) ->
        _steps = []
        instance = Yadda.createInstance(library, driver: browser.driver)
        # console.log('scearios', arguments);
        steps scenario.steps, (step, done) ->
          _steps.push step
          executeInFlow (->
            Yadda.createInstance(library, driver: browser.driver).run step
            return
          ), (err) ->
            if err
              console.log 'error: ' + err.message
            done err
            return
          return
        return
      return
    return
  return
