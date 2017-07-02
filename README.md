# Install

[NodeJS](https://nodejs.org/) - as usual in accordance with your OS

### *nix
```
$ sudo npm -g install coffee-script protractor phantomjs
$ npm install
```
### Windows

install
* [Python27](https://www.python.org/downloads/release/python-2710/)
* [.NET Framework 2.0 SDK](http://www.microsoft.com/en-us/download/confirmation.aspx?id=19988)

and from nodejs console
```
npm -g install coffee-script protractor phantomjs
npm install
```

# RUN

### Everething
```
$ npm test
```
### Particular spec
```
$ protractor conf.coffee --specs=spec/<spec-name>
```

# Useful links

### Protractor
  Wrapper for testing angular-based apps (used in step definitions)

http://angular.github.io/protractor/#/

### yadda
  BDD-framework going through `*.feature` files and calling steps from `library.coffee`

http://acuminous.gitbooks.io/yadda-user-guide/content/en/index.html

### Documentation for Cucumber language and Scenarios
https://cucumber.io/docs/reference


# ToDo

* reporter
* structure refactoring (spit library into bunch of files)
