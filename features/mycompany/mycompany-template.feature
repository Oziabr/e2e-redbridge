@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Оргструктура
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

Scenario: Переход в подраздел Оргструктура и проверка его наличия
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "HR"
    When wait "350"
    And ткнуть в меню второго уровня на "Оргструктура"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Переход в карточку структуры подразделения
    When нажать на тоггл "Группа компаний "Заря"
    And нажать на значок eye
    Then wait "750"
    Then pause
