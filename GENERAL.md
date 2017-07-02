## What is integrational (or **e2e**) testing

This is one of the many ways to test your webapp automaticaly (not to confuse with unit-testing). It simulates end-user actions which is closely corresponds to an actual interaction of a real user and production setup.

## The reasoning behind integrating this tests into your workflow

To ensure:
+ already existed functionality is not affected by introduction of new features (no regression)

## Requirement for integration testing

+ independency - testing system should no be aware about any specifics of test subject (but the URL)
+ readability - useable and compehendable reports
+ writeability for non programmers (Q&A, PM, PO) - ability to write test specification in a natural language
+ repeatability - for running same scenarios with different datasets (substitution tables to the recque)
+ writeability for coders - easy to implement test steps
+ __reliability on visual properties of elements__ - do not use css-selectors and predefined coordinates, also to keeps in check viewport
+ have interactive mode - for steps and scenario debugging
+ runs in the developer environment in an actual browser window, as well as in headless mode on test server

also is good to have a compatibility with AngularJS for it could not hurt )

## Implementation plan
+ describe and run simple scenario [DONE]
+ describe and test bigger scenario working with many different components [DONE]
+ delegate ability to write and execute tests to any interested party [DONE]

The latter should be done in two ways:
+ distribute test environment among all interested party (as from repository)
+ made centralized testing server, which can be plugged in to CI

## Components map

Testing by a developer:

`protractor` -> `yadda` -> `chrome/firefox`

Testing on headless server:

`protractor` -> `yadda` -> `webdriver` -> `phantomjs`

here:
+ [yadda](https://github.com/acuminous/yadda-user-guide/blob/master/en/SUMMARY.md) - provided human-oriented testing scenarios
+ [protractor](https://angular.github.io/protractor/#/) - executes particular steps over a test-subject
+ webdriver - selenium-server, which allows to execute scenarios on web-browsers different from Chrome and Firefox
+ phantomjs - webkit based headless browser



