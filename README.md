# Установка

[NodeJS](https://nodejs.org/) - в соответствии с инструкцией для конкретной ОС

### в никсах
```
$ sudo npm -g install coffee-script protractor phantomjs
$ npm install
```
### в окнах

установить
* [Python27](https://www.python.org/downloads/release/python-2710/)
* [.NET Framework 2.0 SDK](http://www.microsoft.com/en-us/download/confirmation.aspx?id=19988)

и из nodejs консоли
```
npm -g install coffee-script protractor phantomjs
npm install
```

# Запуск

### Всего подряд
```
$ npm test
```
### Одного раздела
```
$ protractor conf.coffee --specs=spec/<spec-name>
```

# Useful links

### Protractor
  Ангуляровская обёртка тестовой системы (используется в определении шагов)

http://angular.github.io/protractor/#/

### yadda
  BDD-framework обрабатывает файлы .feature и зовёт шаги из library.coffee

http://acuminous.gitbooks.io/yadda-user-guide/content/en/index.html

# ToDo

* прикрутить репортер
* перебрать структуру (разнести библиотеку по разным файлам в отдельном каталоге)

# Обновление сервера
git pull

git checkout 'название ветки'

/var/www/main.test.redbridge-arm.com/htdocs/config/db* config/

sudo cp -r ./* /var/www/main.test.redbridge-arm.com/htdocs/

sudo chown www-data:www-data -R /var/www/main.test.redbridge-arm.com/htdocs/
