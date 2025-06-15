# Эта переменная в env'ах нужна для docker-compose: локальные пути будут определяться корректно
export PWD := $(shell pwd)

hello:
	@echo 'Build Asman project'

deps:
	@echo 'Pull dependencies'
	@git submodule update --init --recursive
	@git submodule foreach 'git checkout main && git pull'

deps-init:
	@echo 'Pull project and dependencies recursively'
	@git pull --recurse-submodules

l-deploy:
	# Останавливаем контейнеры, если запущены
	@docker compose -f configs/docker-compose/docker-compose.yml --profile all down
	# Собираем и запускаем
	@docker compose -f configs/docker-compose/docker-compose.yml --profile all build
	@docker compose -f configs/docker-compose/docker-compose.yml --profile all up

t-deploy:
	@echo 'Поднимаем окружение для тестов'
	# Останавливаем контейнеры, если запущены
	@docker compose -f configs/docker-compose/docker-compose.yml --profile test down
	# Собираем и запускаем
	@docker compose -f configs/docker-compose/docker-compose.yml --profile test build
	@docker compose -f configs/docker-compose/docker-compose.yml --profile test up
