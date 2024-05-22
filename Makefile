RM := rm -fr

GR= \033[32;1m
RE= \033[31;1m
YE= \033[33;1m
CY= \033[36;1m
RC= \033[0m

all: up-d

.PHONY: up
up : $(ENVFILE)
	@printf "$(CY)"
	@echo "Starting up..."
	@printf "$(RC)"
	docker compose up

.PHONY: up-d
up-d : $(ENVFILE)
	@printf "$(CY)"
	@echo "Starting up..."
	@printf "$(RC)"
	docker compose up -d

env :
	@printf "$(YE)"
	@echo "Creating .env file..."
	@printf "$(RC)"
	@cp ./.env.dev ./.env

.PHONY: down
down :
	@printf "$(RE)"
	@echo "Shutting down..."
	@printf "$(RC)"
	docker compose down

.PHONY: rebuild
rebuild : down
	docker compose build --no-cache

.PHONY: front
front:
	docker compose exec sample-app-nextjs /bin/bash

# .PHONY: network
# network:
# 	docker network create {network_name}