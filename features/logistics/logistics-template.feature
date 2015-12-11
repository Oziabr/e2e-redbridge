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

Scenario: Переход в <Логистика - Заказы - Товары>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Заказы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Товары"
    Then wait "2500"

Scenario: Добавление одного товара в корзину заказов
    When нажать на кнопку-спрайт Плюс в блоке товара "[Название товара]"
    When wait "750"
    When нажать на кнопку "Добавить в корзину заказа" в блоке товара "[Название товара]"
Examples:
    Название товара
    Комбайн S660
    Пневматическая сеялка 730

Scenario: Добавление нескольких товаров в корзину заказов
    When очистить поле-спинер в блоке товара "[Название товара]"
    When wait "350"
    When заполнить "[Кол-во]" в поле-спинер в блоке товара "[Название товара]"
    When wait "750"
    When нажать на кнопку "Добавить в корзину заказа" в блоке товара "[Название товара]"
Examples:
    Кол-во | Название товара
    3 | Комбайн W540
    5 | Экскаватор Komatsu PC800-6

Scenario: Переход в <Логистика - Заказы - Корзина>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Заказы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Корзина"
    Then wait "1500"

Scenario: Удаление товара из корзины заказов
    When нажать на кнопку "Удалить из корзины" в блоке товара "[Название товара]"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "750"
Examples:
    Название товара
    Комбайн S660
    Пневматическая сеялка 730

Scenario: Удаление товаров из корзины заказов
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When в блоке товара "[Название товара]" нажать на кнопку "Удалить из корзины" в строке таблицы с полем "Empty"
    When в блоке товара "[Название товара]" нажать на кнопку "Удалить из корзины" в строке таблицы с полем "Empty"
    Then wait "750"
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
Examples:
    Название товара
    Комбайн W540
    Экскаватор Komatsu PC800-6

Scenario: Удаление последнего товара из корзины заказов
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When в блоке товара "[Название товара]" нажать на кнопку "Удалить из корзины" в строке таблицы с полем "Empty"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "750"
Examples:
    Название товара
    Комбайн W540

Scenario: Сохранение заказа
    When открыть в расширенном поиске select2 после ярлыка "Поставщик"
    And ввести в поле select2 "Система"
    And выбрать опцию "Система" в select2
    And ввести в текстовой блок после ярлыка "Комментарий" значение "--тестовый-заказ--"
    And нажать на кнопку "Сохранить"
    And нажать на кнопку в Message Box "Создать"
