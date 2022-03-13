# language: ru

Функционал: Сборка из исходников конфигурации
	Как Разработчик/Инженер
	Я Хочу иметь возможность загружать файлы конфигурации
	Чтобы удостовериться в автоматизации сборки конфигурации из исходников

Контекст:
	Допустим я подготовил репозиторий и рабочий каталог проекта
	И я подготовил рабочую базу проекта "./build/ib" по умолчанию
	И Я очищаю параметры команды "oscript" в контексте

Сценарий: Запуск сборки конфигурации из исходников в файл cf
	Допустим Я добавляю параметр "<КаталогПроекта>/src/main.os compile" для команды "oscript"
	И Я добавляю параметр "-s ./cf" для команды "oscript"
	И Я добавляю параметр "-o ./build/1Cv8.cf" для команды "oscript"
    И Я добавляю параметр "--language ru" для команды "oscript"
	Когда Я выполняю команду "oscript"
	Тогда Вывод команды "oscript" содержит
	| Сохранение конфигурации успешно завершено|
	И Код возврата команды "oscript" равен 0
	И файл "./build/1Cv8.cf" существует

Сценарий: Запуск сборки конфигурации из исходников в текущую базу данных
	Допустим Я добавляю параметр "<КаталогПроекта>/src/main.os compile" для команды "oscript"
	И Я добавляю параметр "-s ./cf" для команды "oscript"
	И Я добавляю параметр "-c" для команды "oscript"
	И Я добавляю параметр "--ibconnection /F./build/ib" для команды "oscript"
    И Я добавляю параметр "--language ru" для команды "oscript"
	Когда Я выполняю команду "oscript"
	Тогда Вывод команды "oscript" содержит
	| Загрузка конфигурации из файлов успешно завершена|
	И Код возврата команды "oscript" равен 0
	И файл "./cf/ConfigDumpInfo.xml" существует

Сценарий: Запуск сборки конфигурации из исходников в файл cf с изменением номера сборки
	Допустим Я добавляю параметр "<КаталогПроекта>/src/main.os compile" для команды "oscript"
	И Я добавляю параметр "-s ./cf" для команды "oscript"
	И Я добавляю параметр "-o ./build/1Cv8.cf" для команды "oscript"
    И Я добавляю параметр "--build-number 1514" для команды "oscript"
    И Я добавляю параметр "--language ru" для команды "oscript"
	Когда Я выполняю команду "oscript"
	Тогда Вывод команды "oscript" содержит
    | Изменяю номер сборки в исходниках конфигурации 1С на 1514 |
	| Сохранение конфигурации успешно завершено|
	И Код возврата команды "oscript" равен 0

	Тогда файл "./build/1Cv8.cf" существует
    Тогда файл "cf/Configuration.xml" содержит "<Version>1.0.0.1514</Version>"

	Дано файл "build/cf/Configuration.xml" не существует
	Дано Я создаю каталог "build/cf" в рабочем каталоге
	И Я очищаю параметры команды "oscript" в контексте

	Дано Я добавляю параметр "<КаталогПроекта>/src/main.os decompile" для команды "oscript"
	И Я добавляю параметр "-i ./build/1Cv8.cf" для команды "oscript"
	И Я добавляю параметр "-o ./build/cf" для команды "oscript"
	И Я добавляю параметр "--ibconnection /F./build/ib" для команды "oscript"
    И Я добавляю параметр "--language ru" для команды "oscript"
	Когда Я выполняю команду "oscript"
	Тогда Вывод команды "oscript" содержит
	| Запускаю выгрузку конфигурации в исходники |
	| Выгрузка в исходники завершена |
	И Код возврата команды "oscript" равен 0
    Тогда файл "build/cf/Configuration.xml" содержит "<Version>1.0.0.1514</Version>"
