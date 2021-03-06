@goodRead=http://hackersome.com/p/shazam/yadda
Feature: Мои компании
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

Scenario: Проход по разделу <Мои клиенты - Мои компании> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Мои клиенты"
    When wait "350"
    And ткнуть в меню второго уровня на "Мои компании"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Создание новых компаний
    When нажать на кнопку "Создать"
    When wait "350"
    And ввести в поле внутри ярлыка рядом с "Название компании" значение "[Компания]"
    And нажать на кнопку в модальном окне "Сохранить и остаться в списке"
    Then wait "750"
Examples:
    Компания
    --тестовый-холдинг--
    --тестовый-филиал--

Scenario: Создание новой компании c заполнением карточки
    When нажать на кнопку "Создать"
    When wait "350"
    And ввести в поле внутри ярлыка рядом с "Название компании" значение "--тестовая-компания--"
    And нажать на кнопку в модальном окне "Сохранить и открыть карточку"

# Компания - Общая информация
    And открыть select2 рядом с ярлыком "Филиал"
    And выбрать опцию "Воронеж"
    And нажать на чекбокс "Ключевой клиент"
    # And нажать на значок pencil-square-o # конфликт со значком в меню
    # And ввести в поле внутри ярлыка рядом с "Веб-сайт" значение "ya.ru"
    And ввести в поле внутри ярлыка рядом с "Электронная почта" значение "example@test.com"
    And ввести в поле внутри ярлыка рядом с "Контактный телефон" значение "8-915-123-45-78"
    And открыть select2 рядом с ярлыком "Входит в:"
    And выбрать опцию "--тестовый-холдинг--"
    Then wait "750"
# добавление дочерних компаний
# выбор классификации
# описание

# Компания - Контакты
#
# Компании - Контакты - Создание контакта x2
# заполнить Фамилию
# заполнить Имя
# заполнить Отчество
# заполнить Должность
# заполнить Телефон
# заполнить Мобильный
# заполнить Скайп
# заполнить E-mail
# Сохранить
#
# Компании - Контакты - Карточка контакта
# перейти в контакт
# написать комментарий
# вернуться в список
#
# Компании - Контакты - Удаление контакта
# удалить контакт
# зайти во второй контакт и удалить его изнутри


# Компания - Адреса ?

# Компания - Специализация
# ввести специализацию
# сохранить
# добавить продукцию
# удалить продукцию

# Компания - Коммуникация
# проверка возможности создания встречи

# Компания - Сделки
# проверка возможности создания сделки

# Компания - Юр Лица
#
# Компания - Создание Юр Лица x2
# создать и перейти в карточку
# заполнить юридическое наименование
# заполнить сокращенное наименование
# заполнить наименование на иностранном языке
# заполнить ФИО генерального директора
# заполнить юридеческий адрес
# заполнить ОГРН
# заполнить ОКПО
# заполнить ОКАТО
# заполнить ОКВЭД
# заполнить ИНН
# заполнить КПП
# заполнить Расчетный счет
# Добавить банк
# заполнить наименование банка
# заполнить корреспондентский счет
# заполнить SWIFT
# удалить банк
# создать
# вернуться в список
#
# Компания - Карточка Юр Лица
# перейти в карточку
# удалить
#
# Компания - Удаление Юр лица
# удалить снаружи

Scenario: Проход по разделу <Мои клиенты - Мои компании> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Мои клиенты"
    When wait "350"
    And ткнуть в меню второго уровня на "Мои компании"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Поиск компании в фильтре и переход
    When ввести в поле с плейсхолдером "Название компании..." значение "13-я годовщина Октября"
    And нажать на кнопку "Поиск"
    And нажать на результат поиска компаний "13-я годовщина Октября"

Scenario: Проход по табам в карточке компании
    When перейти на вкладку "[Название вкладки]"
    Then wait "350"
    Then нет всплывающих окон
Examples:
    Название вкладки
    Контакты
    Адреса
    Специализация
    Коммуникация
    Сделки
    Общая информация

Scenario: Проход по разделу <Мои клиенты - Мои компании> и проверка
    When ткнуть в меню на "Сегодня"
    When wait "1500"
    When ткнуть в меню на "Мои клиенты"
    When wait "350"
    And ткнуть в меню второго уровня на "Мои компании"
    Then wait "1500"
    Then нет ошибок
    Then нет всплывающих окон

Scenario: Поиск компании в фильтре и удаление
    When ввести в поле с плейсхолдером "Название компании..." значение "[Компания]"
    And нажать на кнопку "Поиск"
    And нажать на результат поиска компаний "[Компания]"
    And нажать на кнопку "Удалить"
    When wait "350"
    And нажать на кнопку в модальном окне "Да"

Examples:
    Компания
    --тестовый-филиал--
    --тестовый-холдинг--
    --тестовая-компания--
