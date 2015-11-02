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

  @Given /^перейти "([^"]*)"$/, (url) ->
    browser.get url
  @Given /^logged in as "([^"]*)" with password "([^"]*)"$/, (user, pass) ->
    $("#loginform-username").sendKeys user
    $("#loginform-password").sendKeys pass
    $('[type="submit"]').click()
  @Given /^open menu$/, (item) ->
    $('[data-action="toggleMenu"]').click()
    browser.driver.sleep(1000)

  @Given "написать $msg", (msg) ->
    console.log 'пишем сообщение в консоль', msg
    browser.driver.sleep(1000)

  # ====

  @When /^ткнуть в меню на "([^"]*)"$/, (item) ->
    element(By.cssContainingText('.menu-item-parent', item)).click()

  @When /^нажать на кнопку "([^"]*)"$/, (text) ->
    element(By.cssContainingText('btn', text)).click()

  @When /^нажать на псевдо кнопку "([^"]*)"$/, (text) ->
    element(By.cssContainingText('a.btn', text)).click()

  @When /^нажать на кнопку со значком "([^"]*)"$/, (ico) ->
    $("[class='fa fa-#{ico}']").click()

  @When /^ввести в поле, следующее после ярлыка "([^"]*)" значение "([^"]*)"$/, (label, text) ->
    element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::input')).sendKeys(text)

  # ====

  @Then /^нет модального окна$/, ->
    $$('.modal').count().then (count) ->
      expect(count).to.be.equal 0

  @Then /^в таблице, в блоке "([^"]*)", есть строка c тесктом "([^"]*)", чье значение равно "([^"]*)"$/, (block, search, value) ->
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