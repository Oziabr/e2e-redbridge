@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Логистика
# Background:
#     Given установить окно 1200 x 800
#     Given перейти about:blank
#     Given перейти http://main.test.redbridge-arm.com
Scenario: Login&Setup
    Given установить окно 1200 x 800
    And перейти about:blank
    And перейти http://main.test.redbridge-arm.com
    And заполнить поле с логином test003
    And заполнить поле с паролем test003
    And залогиниться

Scenario: Переход на раздел Пользователи и проверка его наличия
    When запуск таймера Move
    When ткнуть в меню на Логистика
    When wait "750"
    And ткнуть в меню второго уровня на Сегодня
    Then остановка таймера Move
    Then wait "3000"
