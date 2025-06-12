export PWD := $(shell pwd)

hello:
	@echo 'Build Asman project'

deps:
	@git submodule update --recursive

l-deploy:
	@echo 'Поднимаем приложение локально ${PWD} ???'
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
