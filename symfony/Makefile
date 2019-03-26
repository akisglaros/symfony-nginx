SHELL='/bin/bash'

composer-build:
	docker build \
			--tag custom-composer \
			make/composer

composer-install-dev:
	make composer-build
	docker run \
			--rm \
			--tty \
			--interactive \
			--volume "$(PWD)":/app \
			--user $(shell id -u):$(shell id -g) \
			custom-composer install

composer-install-production:
	make composer-build
	docker run \
			--rm \
			--tty \
			--interactive \
			--volume "$(PWD)":/app \
			--user $(shell id -u):$(shell id -g) \
			custom-composer install --no-dev

composer-require:
	make composer-build
	docker run \
			--rm \
			--tty \
			--interactive \
			--volume "$(PWD)":/app \
			--user $(shell id -u):$(shell id -g) \
			custom-composer require --update-no-dev

composer-update:
	make composer-build
	docker run \
			--rm \
			--tty \
			--interactive \
			--volume "$(PWD)":/app \
			--user $(shell id -u):$(shell id -g) \
			custom-composer update --no-dev

composer-remove:
	make composer-build
	docker run \
			--rm \
			--tty \
			--interactive \
			--volume "$(PWD)":/app \
			--user $(shell id -u):$(shell id -g) \
			custom-composer remove --update-no-dev $(PACKAGE)

code-standards-fix:
	make composer-install-dev
	docker run \
			--rm \
			--tty \
			--interactive \
			--volume "$(PWD)":/app \
			--workdir /app \
			php:7.0.27-cli vendor/bin/php-cs-fixer fix $(FILE)

test-unit:
	make composer-install-dev
	docker build \
			--tag unit-test \
			make/test
	docker run \
			--rm \
			--tty \
			--interactive \
			--volume "$(PWD)":/app \
			--workdir /app \
			unit-test vendor/bin/phpunit $(FILE)

test-unit-all:
	make composer-install-dev
	docker build \
			--tag unit-test \
			make/test
	docker run \
			--rm \
			--tty \
			--interactive \
			--volume "$(PWD)":/app \
			--workdir /app \
			unit-test vendor/bin/phpunit mvc_tests/

dump-autoload:
	docker run \
			--rm \
			--tty \
			--interactive \
			--volume "$(PWD)":/app \
			--workdir /app/mvc/classmap \
			composer/composer:1.0 dumpautoload
