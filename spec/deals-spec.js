/* jslint node: true */
/* global browser, describe, featureFile, scenarios, steps */
"use strict";

var Yadda = require('yadda');
var library = require('../library');
var fs = require('fs');
var async = require('async');

Yadda.plugins.jasmine.StepLevelPlugin.init();

describe('Deals', function () {

    new Yadda.FeatureFileSearch('features/deals').each(function (file) {
        featureFile(file, function (feature) {
            scenarios(feature.scenarios, function (scenario) {
                var _steps = [];
                var instance = Yadda.createInstance(library, {driver: browser.driver})
                // console.log('scearios', arguments);
                steps(scenario.steps, function (step, done) {
                    _steps.push(step);
                    executeInFlow(function () {
                        Yadda.createInstance(library, {driver: browser.driver}).run(step);
                    }, function (err) {
                        if (err) console.log('error: ' + err.message);
                        done(err);
                    });
                });
                // executeInFlowSeries(_steps, instance, function (err) {
                //     if (err) console.log('error: ' + err.message);
                // });
            });
        });
    });
});

function executeInFlow(fn, done) {
    browser.driver.controlFlow().execute(fn).then(function () {
        done();
    }, function (err) {
        if (err) console.log('error: ' + err.message);
    });
}
function executeInFlowSeries(steps, instance, done) {
    async.eachSeries( steps, function (item, callback) {
        browser.driver.controlFlow().execute(instance.run(item)).then(function () {
            callback();
        }, function (err) {
            if (err) console.log('error: ' + err.message);
        });
    }, done)
}
