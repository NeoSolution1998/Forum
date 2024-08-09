# Makefile for easy development commands

# Флаг для отображения подробной информации
VERBOSE ?= false

# Команда для линтинга с PHP CodeSniffer
lint:
	@echo "запускаем PHP CodeSniffer..."
	@vendor/bin/phpcs --standard=phpcs.xml

# Команда для автоматического исправления проблем с PHP CodeSniffer
lint-fix:
	@echo "запускаем PHP CodeSniffer с автоматическим исправлением"
	@vendor/bin/phpcbf --standard=phpcs.xml

# Команда для запуска тестов
test:
	@echo "Запускаем тесты."
	@php artisan test

# Команда для обновления зависимостей Composer
composer-update:
	@echo "Updating Composer dependencies..."
	@composer update

# Команда для очистки кэша и временных файлов
cache-clean:
	@echo "Cleaning up..."
	@rm -rf storage/framework/cache/* storage/logs/*.log

# Команда по умолчанию
all: lint test

# Примечание: добавьте "make help" для получения списка команд
help:
	@echo "Available commands:"
	@echo "  make lint            - Run PHP CodeSniffer"
	@echo "  make lint-fix        - Automatically fix PHP CodeSniffer issues"
	@echo "  make test            - Run tests"
	@echo "  make composer-update - Update Composer dependencies"
	@echo "  make clean           - Clean up cache and logs"
	@echo "  make all             - Run lint and test"
	@echo "  make help            - Display this help message"

.PHONY: lint lint-fix test composer-update clean all help
