'use strict';
var Yadda, chai, expect;

Yadda = require('yadda');

chai = require('chai');

chai.use(require('chai-as-promised'));

expect = chai.expect;


/*
browser.driver.get('http://main.test.redbridge-arm.com')
browser.driver.manage().window().setSize(1200,800)
$("#loginform-username").sendKeys('test003')
$("#loginform-password").sendKeys('test003')
$('[type="submit"]').click()

element(By.cssContainingText('.menu-item-parent', 'KPI')).click()
element.all(By.cssContainingText('tr', 'уникальный')).filter(function(el, index) {return el.getText().then(function(text) {return text == 'уникальный-тестовый-идентификатор-шаблона Годовой'}) }).getText()
element.all(By.cssContainingText('tr', 'уникальный-тестовый-идентификатор-шаблона')).filter(function(el, index) {return el.getText().then(function(text) {return text == 'уникальный-тестовый-идентификатор-шаблона Годовой'}) }).getWebElements().length
$$()
element.all(By.cssContainingText('tr', 'уникальный-тестовый-идентификатор-шаблона')).filter(function(el, index) {return el.element(By.css('.fa-trash')).click() });
element.all(By.cssContainingText('tr', 'уникальный-тестовый-идентификатор-шаблона')).element(By.css('.fa-trash')).getWebElements()

element(By.cssContainingText('tr', 'уникальный-тестовый-идентификатор-шаблона')).element(By.css('.fa-trash')).click()

element(By.cssContainingText('a', 'Список шаблонов KPI')).click()
 */

module.exports = (function() {
  var library;
  library = new Yadda.localisation.English.library().given('тихо исполняем $msg', function(msg) {}).given('пишем с задержкой $msg', function(msg) {
    return browser.driver.sleep(1000).then(function() {
      return console.log('пишем сообщение в консоль', msg);
    });
  }).given('пишем $msg', function(msg) {
    return console.log('пишем сообщение в консоль', msg);
  }).when('pause', function() {
    return browser.pause();
  }).then('pause', function() {
    return browser.pause();
  }).when('wait "$mil"', function(mil) {
    return browser.driver.sleep(parseInt(mil));
  }).then('wait "$mil"', function(mil) {
    return browser.driver.sleep(parseInt(mil));
  }).given('запуск таймера "$label"', function(label) {
    return console.time(label);
  }).when('запуск таймера "$label"', function(label) {
    return console.time(label);
  }).then('запуск таймера "$label"', function(label) {
    return console.time(label);
  }).given('остановка таймера "$label"', function(label) {
    return console.timeEnd(label);
  }).when('остановка таймера "$label"', function(label) {
    return console.timeEnd(label);
  }).then('остановка таймера "$label"', function(label) {
    return console.timeEnd(label);
  }).given('установить окно $width x $height', function(width, height) {
    return browser.driver.manage().window().setSize(parseInt(width), parseInt(height));
  }).given('перейти на $url', function(url, cb) {
    return browser.driver.get(url);
  }).given('заполнить поле с логином "$user"', function(user) {
    return $("#loginform-username").sendKeys(user);
  }).given('заполнить поле с паролем "$pass"', function(pass) {
    return $("#loginform-password").sendKeys(pass);
  }).given('залогиниться', function() {
    return $('[type="submit"]').click();
  }).given('убрать тулбар', function() {
    return $('.yii-debug-toolbar-toggler').click();
  }).when('прокрутить страницу вниз', function() {
    return browser.executeScript('window.scrollTo(0,document.body.scrollHeight);');
  }).when('прокрутить страницу вверх', function() {
    return browser.executeScript('window.scrollTo(0,0);');
  }).when('прокрутить страницу к кнопке "$button"', function(button) {
    return browser.executeScript("arguments[0].scrollIntoView();", element(By.cssContainingText('.btn', button)).getWebElement());
  }).when('обновить страницу', function() {
    return browser.refresh();
  }).when('ткнуть в меню на "$item"', function(item) {
    return element(By.cssContainingText('nav > ul > li > a > .menu-item-parent', item)).click();
  }).when('ткнуть в меню второго уровня на "$item"', function(item) {
    return element(By.cssContainingText('nav > ul > li.open > ul > li > a > .menu-item-parent', item)).click();
  }).when('ткнуть в меню третьего уровня на "$item"', function(item) {
    return element(By.cssContainingText('nav > ul > li.open > ul > li.open > ul > li > a > .menu-item-parent', item)).click();
  }).when('ткнуть в меню четвертого уровня на "$item"', function(item) {
    return element(By.cssContainingText('nav > ul > li.open > ul > li.open > ul > li.open > ul > li > a > .menu-item-parent', item)).click();
  }).when('погасить все сообщения', function() {
    return $$('.foto').click();
  }).when('нажать на ссылку "$text"', function(text) {
    return element(By.cssContainingText('a', text)).click();
  }).when('нажать на кнопку "$text"', function(text) {
    return element(By.cssContainingText('button.btn', text)).click();
  }).when('нажать на типо кнопку "$text"', function(text) {
    return element(By.cssContainingText('.btn', text)).click();
  }).when('нажать на псевдо кнопку "$text"', function(text) {
    return element(By.cssContainingText('a.btn', text)).click();
  }).when('нажать на значок $ico', function(ico) {
    return $("span i.fa-" + ico).click();
  }).when('нажать на кнопку со значком $ico', function(ico) {
    return $("a i.fa-" + ico).click();
  }).when('нажать на кнопку с глификоном $glyphicon', function(glyphicon) {
    return $("button .glyphicon.glyphicon-" + glyphicon).click();
  }).when('нажать на кнопку в модальном окне "$text"', function(text) {
    return element(By.cssContainingText('.modal .btn', text)).click();
  }).when('нажать на псевдо кнопку в модальном окне "$text"', function(text) {
    return element(By.cssContainingText('.modal a.btn', text)).click();
  }).when('ввести в поле, следующее после ярлыка "$label" значение "$text"', function(label, text) {
    return element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::input')).sendKeys(text);
  }).when('ввести в поле внутри ярлыка рядом с "$label" значение "$text"', function(label, text) {
    return element(By.cssContainingText('label label', label)).element(By.xpath('following-sibling::input')).sendKeys(text);
  }).when('нажать на чекбокс "$label"', function(label) {
    return element(By.cssContainingText('.checkbox', label)).click();
  }).when('очистить поле со значком, следующее после ярлыка "$label"', function(label) {
    return element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::p/input')).sendKeys(protractor.Key.chord(protractor.Key.CONTROL, "a")).then(function() {
      return element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::p/input')).sendKeys(protractor.Key.BACK_SPACE);
    });
  }).when('очистить поле со значком, находящееся рядом с ярлыком "$label"', function(label) {
    return element(By.cssContainingText('label', label)).element(By.xpath('..')).$('input').sendKeys(protractor.Key.chord(protractor.Key.CONTROL, "a")).then(function() {
      return element(By.cssContainingText('label', label)).element(By.xpath('..')).$('input').sendKeys(protractor.Key.BACK_SPACE);
    });
  }).when('ввести в поле со значком, следующее после ярлыка "$label" значение "$text"', function(label, text) {
    return element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::p/input')).sendKeys(text);
  }).when('ввести в поле со значком, находящееся рядом с ярлыком "$label" значение "$text"', function(label, text) {
    return element(By.cssContainingText('label', label)).element(By.xpath('..')).$('input').sendKeys(text);
  }).when('ввести в поле с плейсхолдером "$placeholder" значение "$text"', function(placeholder, text) {
    return $("[placeholder='" + placeholder + "']").sendKeys(text);
  }).when('ввести в поле с иконкой "$ico" текст "$text"', function(ico, text) {
    return $(".input-group .glyphicon-" + ico).element(By.xpath('../following-sibling::input')).sendKeys(text);
  }).when('ввести в поле, следующее после не ярлыка _в_модуле_user_ "$label" значение "$text"', function(label, text) {
    return element(By.cssContainingText('.smart-form p', label)).element(By.xpath('following-sibling::div')).$('input').sendKeys(text);
  }).when('нажать на кнопку со значком "$ico" в строке таблицы с полем "$search"', function(ico, search) {
    return element(By.cssContainingText('tr', search)).element(By.css(".fa-" + ico)).click();
  }).when('нажать на все кнопки со значком "$ico" в строках таблицы с полем "$search"', function(ico, search) {
    return element.all(By.cssContainingText('tr', search)).$$(".fa-" + ico).click();
  }).when('нажать на все кнопки со значком "$ico" во всех строках таблиц', function(ico) {
    return $$("tr .fa-" + ico).click();
  }).when('нажать на все чекбоксы в строках таблицы с полем "$search"', function(search) {
    return element.all(By.cssContainingText('tr', search)).$$('input').click();
  }).when('ввести значение "$text" в строку первой таблицы с полем "$search"', function(text, search) {
    return $$('table').get(0).element(By.cssContainingText('tr', search)).$('input').sendKeys(text);
  }).when('ввести значение "$text" в строку второй таблицы с полем "$search"', function(text, search) {
    return $$('table').get(1).element(By.cssContainingText('tr', search)).$('input').sendKeys(text);
  }).when('выбрать опцию "$option"', function(option) {
    return element(By.cssContainingText('select option', option)).click();
  }).when('открыть select2 после ярлыка "$label"', function(label) {
    return element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::div/div/a')).click();
  }).when('открыть select2 рядом с ярлыком "$label"', function(label) {
    return element(By.cssContainingText('label', label)).element(By.xpath('..')).$$('a.select2-choice').click();
  }).when('выбрать опцию select2 "$option"', function(option) {
    return element(By.cssContainingText('.ui-select-choices-row', option)).click();
  }).when('удалить', function() {
    return element(By.cssContainingText('tr', 'уникальный-тестовый-идентификатор-шаблона')).element(By.css('.fa-trash')).click();
  }).when('нажать на смолбокс с текстом "$text"', function(text) {
    return element(By.cssContainingText('.SmallBox', text)).click();
  }).when('прокрутить страницу к событию "$text"', function(text) {
    return browser.executeScript("arguments[0].scrollIntoView();", element(By.cssContainingText('span.fc-title', text)).getWebElement());
  }).when('нажать на событие календаря "$text"', function(text) {
    return element(By.cssContainingText('span.fc-title', text)).click();
  }).when('нажать на кнопку в тултипе "$text"', function(text) {
    return element(By.cssContainingText('.tooltip a.btn', text)).click();
  }).when('нажать на псевдо заголовок "$text"', function(text) {
    return element(By.cssContainingText('h2 div.ng-scope', text)).click();
  }).when('ввести в поле внутри псевдо заголовка значение "$text"', function(text) {
    return $('h2 input').sendKeys(text);
  }).when('ввести в текстовой блок внутри ярлыка, после "$label" значение "$text"', function(label, text) {
    return element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::label/textarea')).sendKeys(text);
  }).when('нажать на результат поиска компаний "$text"', function(text) {
    return element(By.cssContainingText('a > b.ng-binding', text)).click();
  }).when('перейти на вкладку "$text"', function(text) {
    return element(By.cssContainingText('.company-tabs li > a', text)).click();
  }).when('ввести в поле внутри ярлыка, после "$label" значение "$text"', function(label, text) {
    return element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::label/input')).sendKeys(text);
  }).when('нажать на результат поиска пользователей "$text"', function(text) {
    return element(By.cssContainingText('a.ng-binding', text)).click();
  }).when('ввести в дополнительное поле с иконкой "$ico" текст "$text"', function(ico, text) {
    return $(".input-group-addon .glyphicon-" + ico).element(By.xpath('../following-sibling::input')).sendKeys(text);
  }).then("нет ошибок", function() {
    return $$('.site-error').count().then(function(count) {
      return expect(count).to.be.equal(0);
    });
  }).then("нет модального окна", function() {
    return $$('.modal').count().then(function(count) {
      return expect(count).to.be.equal(0);
    });
  }).then('в таблице есть строка c тесктом "$search", чье значение равно "$value"', function(search, value) {
    return element.all(By.cssContainingText('tr', search)).filter(function(el, index) {
      return el.getText().then(function(text) {
        return text === value;
      });
    }).first().getText().then(function(text) {
      return expect(text).to.be.equal(value);
    });
  }).then('в таблице нет строк c тесктом "$search"', function(search) {
    return element.all(By.cssContainingText('tr', search)).count().then(function(count) {
      return expect(count).to.be.equal(0);
    });
  }).then('всплывающее сообщение типа "$type"', function(type) {
    return $$("#divSmallBoxes .foto .fa.fa-" + type).getWebElements().then(function(list) {
      return (expect(list.length)).to.be.equal(1);
    });
  }).then('заголовок всплывающего сообщения "$header"', function(header, cb) {
    return $('#divSmallBoxes .textoFoto span b').getText().then(function(text) {
      return (expect(text)).to.be.equal(header);
    });
  }).then('текст всплывающего сообщения "$msg"', function(msg) {
    return $('#divSmallBoxes .textoFoto p span').getText().then(function(text) {
      return (expect(text)).to.be.equal(msg);
    });
  });
  return library;
})();
