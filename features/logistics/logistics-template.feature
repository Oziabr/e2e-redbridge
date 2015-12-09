@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Логистика
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

Scenario: Переход в <Логистика - Сегодня>
    When ткнуть в меню на "Логистика"
    When wait "750"
    And ткнуть в меню второго уровня на "Сегодня"
    Then wait "1500"
    Then нет ошибок

Scenario: Переход в <Логистика - Заказы - Товары>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Заказы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Товары"
    Then pause
