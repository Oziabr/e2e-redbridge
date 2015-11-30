@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Мои контакты
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

Scenario: Переход на раздел Мои контакты и проверка его наличия
    When запуск таймера Move
    When ткнуть в меню на Мои клиенты
    When wait "750"
    And ткнуть в меню второго уровня на Мои контакты
    Then остановка таймера Move
    Then wait "3000"

Scenario: Создание нового контакта
    When нажать на кнопку Создать контакт
    When wait "350"
    And ввести в поле, следующее после ярлыка "Фамилия" значение "--тестовый-контакт--"
    And нажать на кнопку в модальном окне "Сохранить"
    Then wait "750"

Scenario: Поиск контакта в фильтре
    When ввести в поле с плейсхолдером "Поиск" значение "--тестовый-контакт--"
    When wait "350"
    And нажать на результат поиска пользователей "--тестовый-контакт--"
    And нажать на кнопку в модальном окне "Сохранить"

Scenario: Удаление контакта
    When нажать на кнопку Удалить
