@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Логистика
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

Scenario: Переход в <Логистика - Заказы - Товары>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Заказы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Товары"
    Then wait "1500"
    Then нет всплывающих окон

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
    Then нет всплывающих окон

Scenario: Удаление товара из корзины заказов
    When нажать на кнопку "Удалить из корзины" в блоке товара "[Название товара]"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"
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
    Then wait "1500"
Examples:
    Название товара
    Комбайн W540

Scenario: Сохранение заказа
    When открыть в расширенном поиске select2 после ярлыка "Поставщик"
    And ввести в поле select2 "Система"
    And выбрать опцию "Система" в select2
    And ввести в текстовой блок после ярлыка "Комментарий" значение "--тестовый-заказ--"
    And нажать на кнопку "Сохранить"
    When wait "350"
    And нажать на кнопку в Message Box "Создать"
    Then wait "1500"

Scenario: Переход в <Логистика - Заказы - Учтенные документы>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Заказы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Учтенные документы"
    Then wait "1500"
    Then нет всплывающих окон

Scenario: Удаление заказа
    When перейти по первой ссылке первого ряда таблицы
    When wait "750"
    # And нажать на кнопку "Удалить документ"
    # When wait "750"
    # And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"


Scenario: Переход в <Логистика - Отгрузки - Товары>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Отгрузки"
    When wait "350"
    And ткнуть в меню третьего уровня на "Товары"
    Then wait "1500"
    Then нет всплывающих окон

Scenario: Добавление одного товара в корзину отгрузок
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Добавить в корзину" в блоке товара "[Название товара]"
Examples:
    Название товара
    Экскаватор-погрузчик WB97
    Экскаватор Komatsu PC800-6
    Экскаватор-погрузчик WB97
    Экскаватор Komatsu PC800-6

Scenario: Удаление одного товара из корзины отгрузок
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Удалить из корзины" в блоке товара "[Название товара]"
Examples:
    Название товара
    Экскаватор-погрузчик WB97
    Экскаватор Komatsu PC800-6

Scenario: Добавление нескольких товаров в корзину отгрузок
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When в блоке товара "[Название товара]" ввести число "[Число]" в строке таблицы с полем "3"
Examples:
    Название товара | Число
    Среднемагистральный самолет Ил-86 | 2
    Погрузчик с бортовым поворотом SK820 | 10

Scenario: Переход в <Логистика - Отгрузки - Корзина>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Отгрузки"
    When wait "350"
    And ткнуть в меню третьего уровня на "Корзина"
    Then wait "1500"
    Then нет всплывающих окон

Scenario: Удаление отдельного товара из корзины отгрузок
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Отменить" в блоке товара "[Название товара]"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"
Examples:
    Название товара
    Экскаватор-погрузчик WB97
    Экскаватор Komatsu PC800-6

Scenario: Удаление товара из корзины отгрузок
    When нажать на кнопку "Удалить из корзины" в блоке товара "[Название товара]"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"
Examples:
    Название товара
    Среднемагистральный самолет Ил-86
    Погрузчик с бортовым поворотом SK820

Scenario: Сохранение отгрузки
    When открыть в расширенном поиске select2 после ярлыка "Склад для отгрузки"
    And ввести в поле select2 "СПБ"
    And выбрать опцию "СПБ" в select2
    And ввести в текстовой блок после ярлыка "Комментарий" значение "--тестовая-отгрузка--"
    And нажать на кнопку "Сохранить"
    When wait "350"
    And нажать на кнопку в Message Box "Создать"
    Then wait "1500"

Scenario: Переход в <Логистика - Отгрузки - Учтенные документы>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Отгрузки"
    When wait "350"
    And ткнуть в меню третьего уровня на "Учтенные документы"
    Then wait "1500"

Scenario: Удаление отгрузки
    When перейти по первой ссылке первого ряда таблицы
    When wait "750"
    And нажать на кнопку "Удалить документ"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"

Scenario: Переход в <Логистика - Перемещения - Товары>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Перемещения"
    When wait "350"
    And ткнуть в меню третьего уровня на "Товары"
    Then wait "1500"

Scenario: Добавление одного товара в корзину перемещений
    When открыть select2 после дива "Склад"
    When wait "350"
    And ввести в поле select2 "[Склад]"
    And выбрать опцию "[Склад]" в select2
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Добавить в корзину" в блоке товара "[Название товара]"
Examples:
    Склад | Название товара
    Склад «Тамбов» | Сочлененный самосвал HM400-1

Scenario: Добавление нескольких товаров в корзину перемещений
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When в блоке товара "[Название товара]" ввести число "[Число]" в строке таблицы с полем "3"
Examples:
    Название товара | Число
    Среднемагистральный самолет Ил-86 | 1
    John Deere Пресс-подборщик серии 852 | 2

Scenario: Удаление одного товара из корзины перемещений
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Удалить из корзины" в блоке товара "[Название товара]"
Examples:
    Название товара
    Сочлененный самосвал HM400-1

Scenario: Переход в <Логистика - Перемещения - Корзина>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Перемещения"
    When wait "350"
    And ткнуть в меню третьего уровня на "Корзина"
    Then wait "1500"

Scenario: Удаление отдельного товара из корзины отгрузок
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Отменить" в блоке товара "[Название товара]"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"
Examples:
    Название товара
    John Deere Пресс-подборщик серии 852

Scenario: Сохранение перемещения
    When открыть в расширенном поиске select2 после ярлыка "Склад куда:"
    And ввести в поле select2 "СПБ"
    And выбрать опцию "СПБ" в select2
    And ввести в текстовой блок после ярлыка "Комментарий" значение "--тестовое-перемещение--"
    And нажать на кнопку "Сохранить"
    When wait "350"
    And нажать на кнопку в Message Box "Создать"
    Then wait "1500"

Scenario: Переход в <Логистика - Перемещения - Учтенные документы>
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Перемещения"
    When wait "350"
    And ткнуть в меню третьего уровня на "Учтенные документы"
    Then wait "1500"
    Then нет всплывающих окон

Scenario: Удаление перемещения
    When перейти по первой ссылке первого ряда таблицы
    When wait "750"
    And нажать на кнопку "Вернуть перемещение"
    When wait "350"
    And нажать на кнопку в Message Box "Переместить"
    Then wait "1500"

Scenario: Проход к разделу <Логистика - Приходы - Покупка - Товары> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Приходы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Покупка"
    When wait "350"
    And ткнуть в меню четвертого уровня на "Товары"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Добавление одного товара в корзину покупки
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Добавить в корзину" в блоке товара "[Название товара]"
Examples:
    Название товара
    Экскаватор-погрузчик WB97
    Экскаватор Komatsu PC800-6
    Экскаватор-погрузчик WB97
    Экскаватор Komatsu PC800-6

Scenario: Удаление одного товара из корзины покупки
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Удалить из корзины" в блоке товара "[Название товара]"
Examples:
    Название товара
    Экскаватор-погрузчик WB97
    Экскаватор Komatsu PC800-6

Scenario: Добавление нескольких товаров в корзину отгрузок
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When в блоке товара "[Название товара]" ввести число "[Число]" в строке таблицы с полем "3"
Examples:
    Название товара | Число
    Пресс-подборщик серии 852 | 5
    Среднемагистральный самолет Ил-86 | 10

Scenario: Проход к разделу <Логистика - Приходы - Покупка - Корзина> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Приходы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Покупка"
    When wait "350"
    And ткнуть в меню четвертого уровня на "Корзина"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Удаление отдельного товара из корзины покупки
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Отменить" в блоке товара "[Название товара]"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"
Examples:
    Название товара
    Экскаватор-погрузчик WB97
    Экскаватор Komatsu PC800-6

Scenario: Удаление товара из корзины покупки
    When нажать на кнопку "Удалить из корзины" в блоке товара "[Название товара]"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"
Examples:
    Название товара
    Среднемагистральный самолет Ил-86
    Трактор Xerion 5000

Scenario: Добавление цены товара в корзине покупки
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When в блоке товара "[Название товара]" ввести цену без НДС "[Цена]" в строке таблицы с полем "[Склад]"
Examples:
    Название товара | Цена | Склад
    Пресс-подборщик серии 852 | 1000000 | Тамбов

Scenario: Сохранение покупки
    When ввести в текстовой блок после ярлыка "Комментарий" значение "--тестовая-покупка--"
    And нажать на кнопку "Сохранить документ"
    Then wait "1500"

Scenario: Проход к разделу <Логистика - Приходы - Учтенные документы> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Приходы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Учтенные документы"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Удаление прихода (покупки)
    When перейти по первой ссылке первого ряда таблицы
    When wait "750"
    And нажать на кнопку "Удалить документ"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"

Scenario: Проход к разделу <Логистика - Приходы - Первичный приход - Товары> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Приходы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Первичный приход"
    When wait "350"
    And ткнуть в меню четвертого уровня на "Товары"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Добавление нескольких товаров в корзину первичного прихода
    When очистить поле-спинер в блоке товара "[Название товара]"
    When wait "350"
    When заполнить "[Кол-во]" в поле-спинер в блоке товара "[Название товара]"
    When wait "750"
    When нажать на кнопку "Добавить в корзину оприходования" в блоке товара "[Название товара]"
Examples:
    Кол-во | Название товара
    1 | Комбайн S660
    2 | Экскаватор Komatsu PC800-6

Scenario: Проход к разделу <Логистика - Приходы - Первичный приход - Корзина> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Приходы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Первичный приход"
    When wait "350"
    And ткнуть в меню четвертого уровня на "Корзина"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Удаление товаров из корзины первичного прихода
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When в блоке товара "[Название товара]" нажать на кнопку "Удалить из корзины" в строке таблицы с полем "Empty"
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
Examples:
    Название товара
    Экскаватор Komatsu PC800-6

Scenario: Удаление последнего товара из корзины первичного прихода
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When в блоке товара "[Название товара]" нажать на кнопку "Удалить из корзины" в строке таблицы с полем "Empty"
    Then wait "750"
Examples:
    Название товара
    Комбайн S660

Scenario: Добавление цены товара в корзине первичного прихода
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Приходы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Первичный приход"
    When wait "350"
    And ткнуть в меню четвертого уровня на "Корзина"
    When wait "1500"
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When в блоке товара "[Название товара]" ввести цену без НДС "[Цена]" в строке таблицы с полем "[SN]"
Examples:
    Название товара | Цена | SN
    Экскаватор Komatsu PC800-6 | 100 | Empty

Scenario: Сохранение первичного прихода
    When открыть в расширенном поиске select2 после ярлыка "Склад"
    And ввести в поле select2 "СПБ"
    And выбрать опцию "СПБ" в select2
    And ввести в текстовой блок после ярлыка "Комментарий" значение "--тестовый-первичный-приход"
    And нажать на кнопку "Создать документ"
    Then wait "1500"

Scenario: Проход к разделу <Логистика - Приходы - Учтенные документы> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Приходы"
    When wait "350"
    And ткнуть в меню третьего уровня на "Учтенные документы"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Удаление прихода (первичного прихода)
    When перейти по первой ссылке первого ряда таблицы
    When wait "750"
    And нажать на кнопку "Удалить документ"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"


Scenario: Проход к разделу <Логистика - Расход товара - Товары> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Расход товара"
    When wait "350"
    And ткнуть в меню третьего уровня на "Товары"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Добавление одного товара в корзину расходов товара
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Добавить в корзину" в блоке товара "[Название товара]"
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    Then wait "750"
Examples:
    Название товара
    Трактор 6M
    Трактор 6M

Scenario: Удаление одного товара из корзины расходов товара
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Удалить из корзины" в блоке товара "[Название товара]"
Examples:
    Название товара
    Трактор 6M

Scenario: Добавление нескольких товаров в корзину расходов товара
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When в блоке товара "[Название товара]" ввести число "[Число]" в строке таблицы с полем "Тамбов"
Examples:
    Название товара | Число
    Среднемагистральный самолет Ил-86 | 10

Scenario: Проход к разделу <Логистика - Расход товара - Корзина> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Расход товара"
    When wait "350"
    And ткнуть в меню третьего уровня на "Корзина"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Удаление отдельного товара из корзины расходов товара
    When открыть скрытую информацию в блоке товара "[Название товара]", нажав на "Подробно"
    When wait "750"
    When нажать на кнопку "Отменить" в блоке товара "[Название товара]"
    When wait "350"
    And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"
Examples:
    Название товара
    Среднемагистральный самолет Ил-86

Scenario: Сохранение расхода товара
    When ввести в текстовой блок после ярлыка "Комментарий" значение "--тестовая-покупка--"
    And нажать на кнопку "Сохранить документ"
    Then wait "1500"

Scenario: Проход к разделу <Логистика - Расход товара - Учтенные документы> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Логистика"
    When wait "350"
    And ткнуть в меню второго уровня на "Расход товара"
    When wait "350"
    And ткнуть в меню третьего уровня на "Учтенные документы"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Удаление расхода товара
    When перейти по первой ссылке первого ряда таблицы
    When wait "750"
#     And нажать на кнопку "Удалить документ"
#     When wait "350"
#     And нажать на кнопку в Message Box "Удалить"
    Then wait "1500"

Scenario: Проход к разделу <Логистика - Pipeline> и проверка
When ткнуть в меню на "Сегодня"
When wait "1500"
When ткнуть в меню на "Логистика"
When wait "350"
And ткнуть в меню второго уровня на "Pipeline"
Then wait "1500"
Then нет ошибок
Then нет всплывающих окон

@Only
Scenario: Проход к разделу <Логистика - Товары на складах> и проверка
When ткнуть в меню на "Сегодня"
When wait "1500"
When ткнуть в меню на "Логистика"
When wait "350"
And ткнуть в меню второго уровня на "Товары на складах"
Then wait "1500"
Then нет ошибок
Then нет всплывающих окон

@Only
Scenario: Поиск товара по наименованию
    When открыть select2 после параграфа "Артикул или наименование"
    And ввести в поле select2 "[Наименование]"
    When wait "350"
    And выбрать опцию "[Наименование]" в select2
    And нажать на кнопку "Показать"
    Then wait "750"
Examples:
    Наименование
    Комбайн S660
    Трактор Xerion 5000
    Трактор 6M

@Only
Scenario: Очистка фильтра
    When нажать на кнопку "Очистить фильтры"
    Then wait "750"

@Only
Scenario: Поиск товара по товарной группе
    When открыть select2 после параграфа "Артикул или наименование"
    And ввести в поле select2 "[Наименование]"
    When wait "350"
    And выбрать опцию "[Наименование]" в select2
    And нажать на кнопку "Показать"
    Then wait "750"
Examples:
    Наименование
    Комбайн S660
    Трактор Xerion 5000
    Трактор 6M

Scenario: Проход к разделу <Логистика - Склады> и проверка
When ткнуть в меню на "Сегодня"
When wait "1500"
When ткнуть в меню на "Логистика"
When wait "350"
And ткнуть в меню второго уровня на "Склады"
Then wait "1500"
Then нет ошибок
Then нет всплывающих окон



Scenario: Проход к разделу <Логистика - Поставщики> и проверка
When ткнуть в меню на "Сегодня"
When wait "1500"
When ткнуть в меню на "Логистика"
When wait "350"
And ткнуть в меню второго уровня на "Поставщики"
Then wait "1500"
Then нет ошибок
Then нет всплывающих окон

Scenario: Добавления поставщика
    When нажать на кнопку "Добавить поставщика"
    When ввести в поле внутри ярлыка, после "Наименование" значение "--тестовый-"
    And нажать на кнопку в модальном окне "Добавить"
    Then wait "750"

Scenario: Поиск поставщика
    When ввести "--тестовый-" в поле для поиска
    Then wait "750"

Scenario: Редактирование поставщика
    When нажать на кнопку со значком "pencil" в строке таблицы с полем "--тестовый-"
    When ввести в поле внутри ярлыка, после "Наименование" значение "поставщик--"
    And нажать на кнопку в модальном окне "Сохранить"
    Then wait "750"

Scenario: Удаление поставщика
    When нажать на кнопку со значком "trash" в строке таблицы с полем "--тестовый-поставщик--"
    When wait "350"
    And нажать на кнопку в Message Box "OK"
    Then wait "1500"
