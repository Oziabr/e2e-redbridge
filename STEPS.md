/features/steps/_steps.coffee

```
chai = require('chai')
chaiAsPromised = require('chai-as-promised')
chai.use chaiAsPromised
expect = chai.expect
module.exports = ->

  # ====

  @Given /^set window size "([^"]*)"x"([^"]*)"$/, (width, height) ->
    browser.driver.manage().window().setSize 1200, 800
  @Given /^sync turned off$/, () ->
    browser.ignoreSynchronization = true
    callback()
  @Given /^sync turned on$/, () ->
    browser.ignoreSynchronization = false

  # ====

  @Given /^go to "([^"]*)"$/, (url) ->
    browser.get url
  @Given /^logged in as "([^"]*)" with password "([^"]*)"$/, (user, pass) ->
    $("#loginform-username").sendKeys user
    $("#loginform-password").sendKeys pass
    $('[type="submit"]').click()
  @Given /^open menu$/, (item) ->
    $('[data-action="toggleMenu"]').click()
    browser.driver.sleep(1000)

  @Given "write $msg", (msg) ->
    console.log 'пишем сообщение в консоль', msg
    browser.driver.sleep(1000)

  # ====

  @When /^select "([^"]*)" in menu$/, (item) ->
    element(By.cssContainingText('.menu-item-parent', item)).click()

  @When /^push button "([^"]*)"$/, (text) ->
    element(By.cssContainingText('btn', text)).click()

  @When /^push pseudo button "([^"]*)"$/, (text) ->
    element(By.cssContainingText('a.btn', text)).click()

  @When /^push button with sign "([^"]*)"$/, (ico) ->
    $("[class='fa fa-#{ico}']").click()

  @When /^type, after the label "([^"]*)", text "([^"]*)"$/, (label, text) ->
    element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::input')).sendKeys(text)

  # ====

  @Then /^not have modal$/, ->
    $$('.modal').count().then (count) ->
      expect(count).to.be.equal 0

  @Then /^table, from the block "([^"]*)", has row with text "([^"]*)", which value is equal to "([^"]*)"$/, (block, search, value) ->
    element(By.cssContainingText('h2', 'Список шаблонов KPI'))
      .element(By.xpath('../../header'))
      .element(By.xpath('following-sibling::div'))
      .element(By.cssContainingText('tr', search))
      .getText()
      .then (text) ->
        expect(text).to.be.equal value

  # ----

  @Then /^the title should equal "([^"]*)"$/, (title, callback) ->
    browser.getTitle().then (actual) ->
      expect(actual).to.be.equal(title)
  @Then /^header is "([^"]*)"$/, (header, callback) ->
    $('h2').getText().then (text) ->
      expect(text).to.be.equal(header)
  @Then /^complete$/, (callback) ->
    process.nextTick callback
```