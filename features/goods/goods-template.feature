@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Товары
# Background:
#     Given установить окно 1200 x 800
#     Given перейти about:blank
#     Given перейти http://main.test.redbridge-arm.com

Scenario: Login&Setup
    Given установить окно 1200 x 800
    And перейти на http://main.test.redbridge-arm.com
    And заполнить поле с логином "test003"
    And заполнить поле с паролем "test003"
    And залогиниться

Scenario: Проход к разделу <Товары - Товары> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Товары"
    When wait "350"
    And ткнуть в меню второго уровня на "Товары"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Добавление нового товара
    When нажать на кнопку "Добавить товар"
    When wait "350"
    And ввести в поле внутри ярлыка после "Наименование" значение "--тестовый-товар--"
    And выбрать опцию "С серийным номером"
    And нажать на кнопку в модальном окне "Добавить и остаться в списке"
    Then wait "750"

Scenario: Поиск контакта в фильтре
    When ввести в дополнительное поле с иконкой "search" текст "--тестовый-товар--"
    When wait "350"
    And нажать на результат поиска пользователей "--тестовый-товар--"

Scenario: Удаление контакта
    When нажать на кнопку "Удалить"
    When wait "350"
    And нажать на кнопку в Message Box "OK"
    Then wait "750"
    Then pause
