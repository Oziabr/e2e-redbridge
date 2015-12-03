'use strict'
Yadda = require('yadda')
chai = require('chai')
chai.use require('chai-as-promised')
expect = chai.expect




###
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

###


module.exports = do ->
  #dictionary = (new (Yadda.Dictionary)).define('LOCALE', /(fr|es|ie)/).define('NUM', /(\d+)/)
  #library = new (Yadda.localisation.English.library)(dictionary)
  library = new (Yadda.localisation.English.library)()

  .given 'тихо исполняем $msg', (msg) ->
    return
  .given 'пишем с задержкой $msg', (msg) ->
    browser.driver.sleep(1000).then ->
      console.log 'пишем сообщение в консоль', msg
  .given 'пишем $msg', (msg) ->
    console.log 'пишем сообщение в консоль', msg

  # --- КОНТРОЛЬ --- пауза
  .when 'pause', ->
    browser.pause()
  .then 'pause', ->
    browser.pause()
  # --- КОНТРОЛЬ --- ожидание
  .when 'wait "$mil"', (mil) ->
    browser.driver.sleep(parseInt mil)
  .then 'wait "$mil"', (mil) ->
    browser.driver.sleep(parseInt mil)

  # --- ТАЙМЕР --- запуск таймера
  .given 'запуск таймера "$label"', (label) ->
    console.time label
  .when 'запуск таймера "$label"', (label) ->
    console.time label
  .then 'запуск таймера "$label"', (label) ->
    console.time label
  # --- ТАЙМЕР --- остановка таймера
  .given 'остановка таймера "$label"', (label) ->
    console.timeEnd label
  .when 'остановка таймера "$label"', (label) ->
    console.timeEnd label
  .then 'остановка таймера "$label"', (label) ->
    console.timeEnd label


  # --- НАВИГАЦИЯ --- размер окна
  .given 'установить окно $width x $height', (width, height) ->
    browser.driver.manage().window().setSize (parseInt width), (parseInt height)
  # --- НАВИГАЦИЯ --- переход к URL
  .given 'перейти на $url', (url, cb) ->
    browser.driver.get url
  # --- НАВИГАЦИЯ --- логин
  .given 'заполнить поле с логином "$user"', (user) ->
    $("#loginform-username").sendKeys user
  .given 'заполнить поле с паролем "$pass"', (pass) ->
    $("#loginform-password").sendKeys pass
  .given 'залогиниться', ->
    $('[type="submit"]').click()
  # --- СЛУЖЕБНАЯ --- убрать тулбар
  .given 'убрать тулбар', ->
    $('.yii-debug-toolbar-toggler').click()
  # --- НАВИГАЦИЯ --- прокрутка
  .when 'прокрутить страницу вниз', ->
    browser.executeScript('window.scrollTo(0,document.body.scrollHeight);')
  .when 'прокрутить страницу вверх', ->
    browser.executeScript('window.scrollTo(0,0);')
  # --- НАВИГАЦИЯ --- прокрутка к кнопке
  .when 'прокрутить страницу к кнопке "$button"', (button) ->
    browser.executeScript("arguments[0].scrollIntoView();", element(By.cssContainingText('.btn', button)).getWebElement())
  # --- НАВИГАЦИЯ --- обновить страницу
  .when 'обновить страницу', ->
    browser.refresh()

  # --- САЙТ --- меню
  .when 'ткнуть в меню на "$item"', (item) ->
    element(By.cssContainingText('nav > ul > li > a > .menu-item-parent', item)).click()
  # --- САЙТ --- раскрытое меню
  .when 'ткнуть в меню второго уровня на "$item"', (item) ->
    element(By.cssContainingText('nav > ul > li.open > ul > li > a > .menu-item-parent', item)).click()
  .when 'ткнуть в меню третьего уровня на "$item"', (item) ->
    element(By.cssContainingText('nav > ul > li.open > ul > li.open > ul > li > a > .menu-item-parent', item)).click()
  .when 'ткнуть в меню четвертого уровня на "$item"', (item) ->
    element(By.cssContainingText('nav > ul > li.open > ul > li.open > ul > li.open > ul > li > a > .menu-item-parent', item)).click()

  # --- СЛУЖЕБНАЯ --- выключить сообщения
  .when 'погасить все сообщения', ->
    $$('.foto').click()
  # --- САЙТ --- переход по ссылке
  .when 'нажать на ссылку "$text"', (text) ->
    element(By.cssContainingText('a', text)).click()


  # --- ИНТЕРАКТИВ --- нажать на кнопку
  .when 'нажать на кнопку "$text"', (text) ->
    element(By.cssContainingText('button.btn', text)).click()
  # --- ИНТЕРАКТИВ --- нажать на типо кнопку
  .when 'нажать на типо кнопку "$text"', (text) ->
    element(By.cssContainingText('.btn', text)).click()
  # --- ИНТЕРАКТИВ --- нажать на кнопку
  .when 'нажать на псевдо кнопку "$text"', (text) ->
    element(By.cssContainingText('a.btn', text)).click()
  # --- ИНТЕРАКТИВ --- нажать на кнопку
  .when 'нажать на значок $ico', (ico) ->
    $("span i.fa-#{ico}").click()
    # --- ИНТЕРАКТИВ --- нажать на кнопку со значком
  .when 'нажать на кнопку со значком $ico', (ico) ->
      $("a i.fa-#{ico}").click()
  # --- ИНТЕРАКТИВ --- нажать на кнопку с глификоном
  .when 'нажать на кнопку с глификоном $glyphicon', (glyphicon) ->
    $("button .glyphicon.glyphicon-#{glyphicon}").click()

  # --- ИНТЕРАКТИВ ->- МОДАЛЬНОЕ ОКНО --- нажать на кнопку
  .when 'нажать на кнопку в модальном окне "$text"', (text) ->
    element(By.cssContainingText('.modal .btn', text)).click()
  # --- ИНТЕРАКТИВ ->- МОДАЛЬНОЕ ОКНО --- нажать на псевдо кнопку
  .when 'нажать на псевдо кнопку в модальном окне "$text"', (text) ->
    element(By.cssContainingText('.modal a.btn', text)).click()
  # --- ФОРМА --- ввести значение в поле
  .when 'ввести в поле, следующее после ярлыка "$label" значение "$text"', (label, text) ->
    element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::input')).sendKeys(text)
  # --- ФОРМА --- ввести значение в поле внутри label
  .when 'ввести в поле внутри ярлыка рядом с "$label" значение "$text"', (label, text) ->
    element(By.cssContainingText('label label', label)).element(By.xpath('following-sibling::input')).sendKeys(text)
  # --- ФОРМА --- нажать чекбокс
  .when 'нажать на чекбокс "$label"', (label) ->
    element(By.cssContainingText('.checkbox', label)).click()
  # --- ФОРМА --- очистить значение
  .when 'очистить поле со значком, следующее после ярлыка "$label"', (label) ->
    element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::p/input')).sendKeys(protractor.Key.chord(protractor.Key.CONTROL, "a")).then ->
      element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::p/input')).sendKeys(protractor.Key.BACK_SPACE)
  .when 'очистить поле со значком, находящееся рядом с ярлыком "$label"', (label) ->
    element(By.cssContainingText('label', label)).element(By.xpath('..')).$('input').sendKeys(protractor.Key.chord(protractor.Key.CONTROL, "a")).then ->
      element(By.cssContainingText('label', label)).element(By.xpath('..')).$('input').sendKeys(protractor.Key.BACK_SPACE)
  # --- ФОРМА --- ввести значение
  .when 'ввести в поле со значком, следующее после ярлыка "$label" значение "$text"', (label, text) ->
    element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::p/input')).sendKeys(text)
  .when 'ввести в поле со значком, находящееся рядом с ярлыком "$label" значение "$text"', (label, text) ->
    element(By.cssContainingText('label', label)).element(By.xpath('..')).$('input').sendKeys(text)
  # --- ФОРМА --- ввести значение
  .when 'ввести в поле с плейсхолдером "$placeholder" значение "$text"', (placeholder, text) ->
    $("[placeholder='#{placeholder}']").sendKeys(text)
  # --- ФОРМА --- ввести значение
  .when 'ввести в поле с иконкой "$ico" текст "$text"', (ico, text) ->
    $(".input-group .glyphicon-#{ico}").element(By.xpath('../following-sibling::input')).sendKeys(text)
  # !!! ФОРМА !!! ввести значение
  .when 'ввести в поле, следующее после не ярлыка _в_модуле_user_ "$label" значение "$text"', (label, text) ->
    element(By.cssContainingText('.smart-form p', label)).element(By.xpath('following-sibling::div')).$('input').sendKeys(text)
  # --- ИНТЕРАКТИВ ->- ТАБЛИЦЫ --- нажать на кнопку
  .when 'нажать на кнопку со значком "$ico" в строке таблицы с полем "$search"', (ico, search) ->
    element(By.cssContainingText('tr', search)).element(By.css(".fa-#{ico}")).click()
  # --- ИНТЕРАКТИВ ->- ТАБЛИЦЫ --- нажать на кнопки
  .when 'нажать на все кнопки со значком "$ico" в строках таблицы с полем "$search"', (ico, search) ->
    element.all(By.cssContainingText('tr', search)).$$(".fa-#{ico}").click()
  # --- ИНТЕРАКТИВ ->- ТАБЛИЦЫ --- нажать на все кнопки
  .when 'нажать на все кнопки со значком "$ico" во всех строках таблиц', (ico) ->
    $$("tr .fa-#{ico}").click()
  # --- ИНТЕРАКТИВ ->- ТАБЛИЦЫ --- нажать на чекбоксы
  .when 'нажать на все чекбоксы в строках таблицы с полем "$search"', (search) ->
    element.all(By.cssContainingText('tr', search)).$$('input').click()
  # --- ИНТЕРАКТИВ ->- ТАБЛИЦЫ --- ввести значение
  .when 'ввести значение "$text" в строку первой таблицы с полем "$search"', (text, search) ->
    $$('table').get(0).element(By.cssContainingText('tr', search)).$('input').sendKeys text
  .when 'ввести значение "$text" в строку второй таблицы с полем "$search"', (text, search) ->
    $$('table').get(1).element(By.cssContainingText('tr', search)).$('input').sendKeys text
  # --- ФОРМА --- выбрать опцию
  .when 'выбрать опцию "$option"', (option) ->
    element(By.cssContainingText('select option', option)).click()
  # --- ФОРМА --- открыть опции --- select2
  .when 'открыть select2 после ярлыка "$label"', (label) ->
    element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::div/div/a')).click()
  # --- ФОРМА --- открыть опции --- select2
  .when 'открыть select2 рядом с ярлыком "$label"', (label) ->
    element(By.cssContainingText('label', label)).element(By.xpath('..')).$$('a.select2-choice').click()
  # --- ФОРМА --- выбрать опцию --- select2
  .when 'выбрать опцию select2 "$option"', (option) ->
    element(By.cssContainingText('.ui-select-choices-row', option)).click()

  .when 'удалить', ->
    element(By.cssContainingText('tr', 'уникальный-тестовый-идентификатор-шаблона')).element(By.css('.fa-trash')).click()

  #Костыли под календарь
  # --- ИНТЕРАКТИВ --- нажать на смолбокс с текстом
  .when 'нажать на смолбокс с текстом "$text"', (text) ->
    element(By.cssContainingText('.SmallBox', text)).click()
  # --- НАВИГАЦИЯ --- прокрутка к событию
  .when 'прокрутить страницу к событию "$text"', (text) ->
    browser.executeScript("arguments[0].scrollIntoView();", element(By.cssContainingText('span.fc-title', text)).getWebElement())
  # --- ИНТЕРАКТИВ --- нажать на событие календаря
  .when 'нажать на событие календаря "$text"', (text) ->
    element(By.cssContainingText('span.fc-title', text)).click()
  # --- ИНТЕРАКТИВ --- нажать на кнопку в тултипе события календаря
  .when 'нажать на кнопку в тултипе "$text"', (text) ->
    element(By.cssContainingText('.tooltip a.btn', text)).click()
  # --- ИНТЕРАКТИВ --- нажать на псевдо заголовок
  .when 'нажать на псевдо заголовок "$text"', (text) ->
    element(By.cssContainingText('h2 div.ng-scope', text)).click()
  #--- ФОРМА --- ввести значение в текстовое поле псевдо заголовка
  .when 'ввести в поле внутри псевдо заголовка значение "$text"', (text) ->
    $('h2 input').sendKeys text
  #--- ФОРМА --- ввести значение в текстовой блок (textarea) внутри label
  .when 'ввести в текстовой блок внутри ярлыка, после "$label" значение "$text"', (label, text) ->
    element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::label/textarea')).sendKeys text

  #Костыли под Мои компании
  # --- ИНТЕРАКТИВ --- нажать на результат поиска компаний
  .when 'нажать на результат поиска компаний "$text"', (text) ->
    element(By.cssContainingText('a > b.ng-binding', text)).click()
  # --- ИНТЕРАКТИВ --- переход по табам
  .when 'перейти на вкладку "$text"', (text) ->
    element(By.cssContainingText('.company-tabs li > a', text)).click()
  # --- ИНТЕРАКТИВ --- переход на скрытые табы

  #Костыли под Пользователи
  #--- ФОРМА --- ввести значение в текстовой блок (textarea) внутри label
  .when 'ввести в поле внутри ярлыка, после "$label" значение "$text"', (label, text) ->
    element(By.cssContainingText('label', label)).element(By.xpath('following-sibling::label/input')).sendKeys text
  # --- ИНТЕРАКТИВ --- нажать на результат поиска пользователей
  .when 'нажать на результат поиска пользователей "$text"', (text) ->
    element(By.cssContainingText('a.ng-binding', text)).click()
  #Костыли под Товары
  # --- ФОРМА --- ввести значение
  .when 'ввести в дополнительное поле с иконкой "$ico" текст "$text"', (ico, text) ->
    $(".input-group-addon .glyphicon-#{ico}").element(By.xpath('../following-sibling::input')).sendKeys(text)

  #Проверки
  # ---  ОШИБКИ --- проверка на наличие ошибок
  .then "нет ошибок", ->
    $$('.site-error').count().then (count) ->
      expect(count).to.be.equal 0

  .then "нет модального окна", ->
    $$('.modal').count().then (count) ->
      expect(count).to.be.equal 0
  .then 'в таблице есть строка c тесктом "$search", чье значение равно "$value"', (search, value) ->
    # element.all(By.cssContainingText('tr', 'уникальный-тестовый')).filter(function(el, index){el.getText().then(function(text) {text == 'уникальный-тестовый'; console.log(text)})}).count()
    element.all(By.cssContainingText 'tr', search)
      .filter (el, index) ->
        el.getText().then (text) ->
          text == value
      .first()
      .getText()
      .then (text) ->
        expect(text).to.be.equal value
  .then 'в таблице нет строк c тесктом "$search"', (search) ->
    element.all(By.cssContainingText 'tr', search)
      .count()
      .then (count) ->
        expect(count).to.be.equal 0
  .then 'всплывающее сообщение типа "$type"', (type) ->
    $$ "#divSmallBoxes .foto .fa.fa-#{type}"
      .getWebElements()
      .then (list) ->
        (expect list.length).to.be.equal 1
  .then 'заголовок всплывающего сообщения "$header"', (header, cb) ->
    $ '#divSmallBoxes .textoFoto span b'
      .getText()
      .then (text) ->
        (expect text).to.be.equal header
  .then 'текст всплывающего сообщения "$msg"', (msg) ->
    $ '#divSmallBoxes .textoFoto p span'
      .getText()
      .then (text) ->
        (expect text).to.be.equal msg

  library
