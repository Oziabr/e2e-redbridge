@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Календарь
# Background:
#     Given установить окно 1200 x 800
#     Given перейти about:blank
#     Given перейти http://main.test.redbridge-arm.com
@Only
Scenario: Login&Setup
    Given установить окно 1200 x 800
    And перейти на http://main.test.redbridge-arm.com
    And заполнить поле с логином "test003"
    And заполнить поле с паролем "test003"
    And залогиниться
@Only
Scenario: Переход на календарь и проверка его наличия
    When запуск таймера "Move"
    When ткнуть в меню на "Мой органайзер"
    When wait "750"
    And ткнуть в меню второго уровня на "Календарь"
    Then остановка таймера "Move"
    Then wait "2500"

Scenario: Создание новой задачи
    When нажать на псевдо кнопку "Создать"
    And нажать на псевдо кнопку "Задача"
    And нажать на псевдо заголовок "Новая задача"
    And ввести в поле внутри псевдо заголовка значение "--тестовая-задача--"
    And ввести в текстовой блок внутри ярлыка, после "Описание" значение "--тестовая-задача--"
    And нажать на кнопку в модальном окне "Сохранить и остаться в календаре"
    When wait "350"
    And нажать на смолбокс с текстом "Success"

@Only
Scenario: Проверка наличия события календаря
    When wait "550"
    Then Проверить количество задач календаря "--тестовая-задача--" равно "1"

Scenario: Проход по разделам Календаря
    When нажать на псевдо кнопку "Неделя"
    And нажать на псевдо кнопку "День"
    And нажать на псевдо кнопку "Список"
    And нажать на псевдо кнопку "Месяц"
    Then wait "350"

Scenario: Создание новой встречи
    And нажать на псевдо кнопку "Создать"
    And нажать на псевдо кнопку "Встреча"
    And нажать на псевдо заголовок "Новая встреча"
    And ввести в поле внутри псевдо заголовка значение "--тестовая-встреча--"
    And ввести в текстовой блок внутри ярлыка, после "Описание" значение "--тестовая-встреча--"
    And нажать на кнопку в модальном окне "Сохранить и остаться в календаре"
    When wait "350"
    And нажать на смолбокс с текстом "Success"

Scenario: Проход по разделам Календаря
    When нажать на псевдо кнопку "Неделя"
    And нажать на псевдо кнопку "День"
    And нажать на псевдо кнопку "Список"
    And нажать на псевдо кнопку "Месяц"
    Then wait "350"

Scenario: Создание нового звонка
    When нажать на псевдо кнопку "Создать"
    And нажать на псевдо кнопку "Звонок"
    And нажать на псевдо заголовок "Новый звонок"
    And ввести в поле внутри псевдо заголовка значение "--тестовый-звонок--"
    And ввести в текстовой блок внутри ярлыка, после "Описание" значение "--тестовый-звонок-"
    And нажать на кнопку в модальном окне "Сохранить и остаться в календаре"
    When wait "350"
    And нажать на смолбокс с текстом "Success"

Scenario: Проход по разделам Календаря
    When нажать на псевдо кнопку "Неделя"
    And нажать на псевдо кнопку "День"
    And нажать на псевдо кнопку "Список"
    And нажать на псевдо кнопку "Месяц"
    Then wait "350"

# Scenario: Внесение изменений в задачу
#изменение названия + сохранение + проверка
#изменение описания + сохранение + проверка
#изменение дедлайна + сохранение + проверка
#изменение статуса + сохранение + проверка
#изменение связанных сделок + сохранение + проверка
#изменение приглашенных + сохранение + проверка
#изменение ответственных + сохранение + проверка
#комментарий + сохранение + проверка
#удаление комментария + сохранение + проверка
# Scenario: Переход на календарь-неделя-день-список-месяц-стрелки-сегодня и проверка с переходом на задачу и обратно
#
# Scenario: Внесение изменений во встречу
#изменение названия + сохранение + проверка
#изменение описания + сохранение + проверка
#изменение даты начала + сохранение + проверка
#изменение времени начала + сохранение + проверка
#изменение времени завершения + сохранение + проверка
#изменение даты завершения + сохранение + проверка
#изменения весь день + сохранение + проверка
#изменение повторы + сохранение + проверка
#изменение статуса + сохранение + проверка
#изменение компании + сохранение + проверка
#изменение связанных сделок + сохранение + проверка
#изменение приглашенных + сохранение + проверка
#изменение ответственных + сохранение + проверка
#изменение местра + сохранение + проверка
#комментарий + сохранение + проверка
#удаление комментария + сохранение + проверка
# Scenario: Переход на календарь-неделя-день-список-месяц и проверка с переходом на встречу и обратно
#
# Scenario: Внесение изменений в звонок
#изменение названия + сохранение + проверка
#изменение описания + сохранение + проверка
#изменение даты начала + сохранение + проверка
#изменение времени начала + сохранение + проверка
#изменение времени завершения + сохранение + проверка
#изменение даты завершения + сохранение + проверка
#изменения весь день + сохранение + проверка
#изменение повторы + сохранение + проверка
#изменение статуса + сохранение + проверка
#изменение компании + сохранение + проверка
#изменение связанных сделок + сохранение + проверка
#изменение приглашенных + сохранение + проверка
#изменение ответственных + сохранение + проверка
#изменение местра + сохранение + проверка
#комментарий + сохранение + проверка
#удаление комментария + сохранение + проверка
# Scenario: Переход на календарь-неделя-день-список-месяц и проверка с переходом на звонок и обратно

@Only
Scenario: Удаление задачи
    # When прокрутить страницу к событию "--тестовая-задача--"
    When wait "550"
    When нажать на событие календаря "--тестовая-задача--"
    When wait "550"
    And нажать на кнопку в тултипе "Изменить"
    When wait "350"
    And нажать на псевдо кнопку "Удалить"
    When wait "350"
    And нажать на кнопку в модальном окне "Удалить"
    And ткнуть в меню второго уровня на "Календарь"

Scenario: Проход по разделам Календаря
    When нажать на псевдо кнопку "Неделя"
    And нажать на псевдо кнопку "День"
    And нажать на псевдо кнопку "Список"
    And нажать на псевдо кнопку "Месяц"
    Then wait "350"
# Scenario: Переход на календарь-неделя-день-список-месяц и проверка

Scenario: Удаление встречи
    When прокрутить страницу к событию "--тестовая-встреча--"
    When wait "350"
    And нажать на событие календаря "--тестовая-встреча--"
    When wait "350"
    And нажать на кнопку в тултипе "Изменить"
    When wait "350"
    And нажать на псевдо кнопку "Удалить"
    When wait "350"
    And нажать на кнопку в модальном окне "Удалить"
    And ткнуть в меню второго уровня на "Календарь"

Scenario: Проход по разделам Календаря
    When нажать на псевдо кнопку "Неделя"
    And нажать на псевдо кнопку "День"
    And нажать на псевдо кнопку "Список"
    And нажать на псевдо кнопку "Месяц"
    Then wait "350"
# Scenario: Переход на календарь-неделя-день-список-месяц и проверка

Scenario: Удаление звонка
    When прокрутить страницу к событию "--тестовый-звонок--"
    When wait "350"
    And нажать на событие календаря "--тестовый-звонок--"
    When wait "350"
    And нажать на кнопку в тултипе "Изменить"
    When wait "350"
    And нажать на псевдо кнопку "Удалить"
    When wait "350"
    And нажать на кнопку в модальном окне "Удалить"
    And ткнуть в меню второго уровня на "Календарь"

Scenario: Проход по разделам Календаря
    When нажать на псевдо кнопку "Неделя"
    And нажать на псевдо кнопку "День"
    And нажать на псевдо кнопку "Список"
    And нажать на псевдо кнопку "Месяц"
    Then wait "350"
# Scenario: Переход на календарь-неделя-день-список-месяц и проверка

# Scenario: Создание задачи + закрытие
# Scenario: Переход на календарь-неделя-день-список-месяц и проверка
#
# Scenario: Создание встречи + закрытие
# Scenario: Переход на календарь-неделя-день-список-месяц и проверка
#
# Scenario: Создание звонка + закрытие
# Scenario: Переход на календарь-неделя-день-список-месяц и проверка

#закрытие с открытием новой
