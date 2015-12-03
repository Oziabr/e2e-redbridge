@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Шаблоны KPI
# Background:
#     Given установить окно 1200 x 800
#     Given перейти http://main.test.redbridge-arm.com

Scenario: Login&Setup
    Given установить окно 1200 x 800
    And перейти на http://main.test.redbridge-arm.com
    And заполнить поле с логином "test003"
    And заполнить поле с паролем "test003"
    And залогиниться

Scenario: Создание нового пользовательского KPI [Временной горизонт]
    When ткнуть в меню на "KPI"
    When wait "750"
    When нажать на кнопку со значком plus
    And нажать на типо кнопку "[Временной горизонт]"
    And ввести в поле, следующее после ярлыка "Название шаблона" значение "уникальный-тестовый-идентификатор-шаблона"
     And нажать на псевдо кнопку "Создать и остаться в списке"
    Then нет модального окна
    And в таблице есть строка c тесктом "уникальный-тестовый-идентификатор-шаблона", чье значение равно "уникальный-тестовый-идентификатор-шаблона '[Временной горизонт]'"
    Then всплывающее сообщение типа "check"
    And заголовок всплывающего сообщения "Создание нового шаблона"
    And текст всплывающего сообщения "'[Временной горизонт]' шаблон  «уникальный-тестовый-идентификатор-шаблона» успешно создан"

Examples:
    Временной горизонт
    Годовой
    Квартальный

Scenario: Неудачное создание нового пользовательского KPI [Временной горизонт] с неуникальным названием
    When ткнуть в меню на "KPI"
    When нажать на кнопку со значком plus
    And нажать на типо кнопку "[Временной горизонт]"
    And ввести в поле, следующее после ярлыка "Название шаблона" значение "уникальный-тестовый-идентификатор-шаблона"
    And нажать на псевдо кнопку "Создать и остаться в списке"
    Then всплывающее сообщение типа "warning"
    And заголовок всплывающего сообщения "Такой KPI уже создан"
    And текст всплывающего сообщения "Необходимо указать уникальное название для данного временного горизонта"

Examples:
    Временной горизонт
    Годовой
    Квартальный

Scenario: Неудачное создание нового пользовательского KPI без названия
    When ткнуть в меню на "KPI"
    When wait "750"
    When нажать на кнопку со значком plus
    And нажать на типо кнопку "[Временной горизонт]"
    And нажать на псевдо кнопку "Создать и остаться в списке"
    Then всплывающее сообщение типа "warning"
    And заголовок всплывающего сообщения "Ошибка валидации"
    And текст всплывающего сообщения "Необходимо заполнить «Название KPI»."

Examples:
    Временной горизонт
    Годовой

Scenario: Неудачное создание нового пользовательского KPI без названия
    When ткнуть в меню на "KPI"
    When нажать на кнопку со значком plus
    And ввести в поле, следующее после ярлыка "Название шаблона" значение "тестовый-идентификатор-шаблона-без-периода"
    And нажать на псевдо кнопку "Создать и остаться в списке"
    Then всплывающее сообщение типа "warning"
    And заголовок всплывающего сообщения "Укажите значение"
    And текст всплывающего сообщения "Необходимо указать временной горизонт"

Scenario: Удаление двух пользовательских KPI
    When ткнуть в меню на "KPI"
    When нажать на кнопку со значком "trash" в строке таблицы с полем "уникальный-тестовый-идентификатор-шаблона"
    And нажать на кнопку со значком "trash" в строке таблицы с полем "уникальный-тестовый-идентификатор-шаблона"
    Then в таблице нет строк c тесктом "уникальный-тестовый-идентификатор-шаблона"
