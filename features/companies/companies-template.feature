@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Мои компании
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

Scenario: Переход на раздел Мои компании и проверка его наличия
    When запуск таймера Move
    When ткнуть в меню на Мои клиенты
    And ткнуть в меню второго уровня на Мои компании
    Then остановка таймера Move
    Then wait "3000"

Scenario: Создание новых компаний
    When нажать на кнопку Создать
    When wait "350"
    And ввести в поле внутри ярлыка рядом с "Название компании" значение "[Компания]"
    And нажать на кнопку в модальном окне "Сохранить и остаться в списке"
    Then wait "750"
Examples:
    Компания
    --тестовый-холдинг--
    --тестовый-филиал--

Scenario: Создание новой компании c заполнением карточки
    When нажать на кнопку Создать
    When wait "350"
    And ввести в поле внутри ярлыка рядом с "Название компании" значение "--тестовая-компания--"
    And нажать на кнопку в модальном окне "Сохранить и открыть карточку"
    And открыть select2 рядом с ярлыком "Филиал"
    And выбрать опцию "Воронеж"
    And нажать на чекбокс "Ключевой клиент"
    And нажать на значок pencil-square-o
    And ввести в поле внутри ярлыка рядом с "Веб сайт" значение "ya.ru"
    And открыть select2 рядом с ярлыком "Входит в:"
    And выбрать опцию "--тестовый-холдинг--"
    And перейти на вкладку "Специализация"
    And перейти на вкладку "Коммуникация"
    And перейти на вкладку "Адреса"
    And перейти на вкладку "Юр Лица"
    And перейти на вкладку "История"
    And перейти на вкладку "Общая информация"
    And нажать на кнопку Список компаний

Scenario: Поиск компании в фильтре и удаление
    When ввести в поле с плейсхолдером "Название компании..." значение "[Компания]"
    And нажать на кнопку Поиск
    And нажать на результат поиска компаний "[Компания]"
    And нажать на кнопку Удалить
    When wait "350"
    And нажать на кнопку в модальном окне "Да"

Examples:
    Компания
    --тестовый-филиал--
    --тестовый-холдинг--
    --тестовая-компания--
