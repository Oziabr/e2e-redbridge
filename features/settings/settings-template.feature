@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Настройки
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

Scenario: Проход к разделу <Настройки - Мой офис> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Мой офис"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Проход к разделу <Настройки - Товары - Группы свойств> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Товары"
    When wait "350"
    And ткнуть в меню третьего уровня на "Группы свойств"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Проверка возможности добавления группы свойств
    When нажать на кнопку "Добавить группу"
    And нажать на кнопку в модальном окне "Закрыть"
    Then wait "750"
    Then нет всплывающих окон
# Добавление группы свойств товаров
# Редактирование группы свойств товаров
# Удаление группы свойств товаров

Scenario: Проход к разделу <Настройки - Товары - Управление тегами> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Товары"
    When wait "350"
    And ткнуть в меню третьего уровня на "Управление тегами"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Проверка возможности добавления тега
    When нажать на кнопку "Добавить тег"
    And нажать на кнопку в модальном окне "Закрыть"
    Then wait "750"
    Then нет всплывающих окон
# Добавление тегов товаров
# Редактирование тегов товаров
# Удаление тегов товаров

Scenario: Проход к разделу <Настройки - Сделки - Конфигуратор> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Сделки"
    When wait "350"
    And ткнуть в меню третьего уровня на "Конфигуратор"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Проверка возможности добавления этапа сделки
    When нажать на кнопку "Добавить"
    And нажать на кнопку в модальном окне "Закрыть"
    Then wait "750"
    Then нет всплывающих окон
# Добавление этапа сделки

Scenario: Переход к карточке этапа сделки
    When перейти по первой ссылке первого ряда таблицы
    Then wait "750"
    Then нет всплывающих окон
# Этап сделки - Добавление пунктов чек-листа
# Редактирование этапа сделки
# Удаление этапа сделки

Scenario: Проход к разделу <Настройки - Сделки - Наборы этапов> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Сделки"
    When wait "350"
    And ткнуть в меню третьего уровня на "Наборы этапов"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Проверка возможности добавления набора этапов сделки
    When нажать на кнопку "Добавить"
    And нажать на кнопку в модальном окне "Закрыть"
    Then wait "750"
    Then нет всплывающих окон
# Добавление набора этапов
# Набор этапов (карточка)
# Добавление этапов в набор этапов
# Удаление этапов из набора этапов
# Удаление набора этапов

Scenario: Проход к разделу <Настройки - Сделки - Пункты чек-листа> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Сделки"
    When wait "350"
    And ткнуть в меню третьего уровня на "Пункты чек-листа"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Проверка возможности добавления пунктов чек-листа
    When нажать на кнопку "Добавить пункт"
    And нажать на кнопку в модальном окне "Закрыть"
    Then wait "750"
    Then нет всплывающих окон
# Добавление пунктов чек-листа
# Редактирование пункта чек-листа
# Удаление пункта чек-листа

Scenario: Проход к разделу <Настройки - Сделки - Проигрыши> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Сделки"
    When wait "350"
    And ткнуть в меню третьего уровня на "Проигрыши"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон
# Добавление пунктов
# Редактирование пункта
# Удаление пункта

Scenario: Проход к разделу <Настройки - Логистика> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Логистика"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Проход к разделу <Настройки - KPI> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "KPI"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Проход к разделу <Настройки - Сброс локальных данных> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Сброс локальных данных"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Проход к разделу <Настройки - Сделки - Пересчитать цены> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Настройки"
    When wait "350"
    And ткнуть в меню второго уровня на "Сделки"
    When wait "350"
    And ткнуть в меню третьего уровня на "Пересчитать цены"
    Then нет ошибок
    # Then текст всплывающего сообщения "Страница будет перезагружена через 5 секунд"
