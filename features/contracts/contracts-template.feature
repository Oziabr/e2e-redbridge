@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Договора
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

Scenario: Проход к разделу <Договоры - Документы поставки> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Договоры"
    When wait "350"
    And ткнуть в меню второго уровня на "Документы поставки"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Создания документа поставки
    When нажать на кнопку "Создать документ"
    And ввести в поле, следующее после ярлыка "Номер договора" значение "--тестовый-договор--"
    And открыть select2 после ярлыка "Компания"
    And выбрать опцию select2 "Авангард ТОО"
    And открыть select2 после ярлыка "Контрагент"
    And выбрать опцию select2 "ООО Авангард, ИНН:"
    And открыть select2 после ярлыка "Сделка"
    And выбрать опцию select2 "15"
    And нажать на кнопку в модальном окне "Сохранить"
    Then wait "750"
    Then нет модального окна
    Then нет всплывающих окон

Scenario: Проверка наличия созданного документа поставки
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Договоры"
    When wait "350"
    And ткнуть в меню второго уровня на "Документы поставки"
    When wait "750"
    And в таблице есть строка c тесктом "--тестовый-договор--", чье значение равно "--тестовый-договор-- 18.01.2015 42 400 000,00 42 400 000,00 15 Авангард ТОО ООО Авангард"
    Then wait "750"

Scenario: Удаление документа поставки
    When нажать на кнопку со значком "trash" в строке таблицы с полем "--тестовый-договор--"
    When wait "350"
    Then в таблице нет строк c тесктом "--тестовый-договор--"
