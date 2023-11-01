DOCK_COMP_PATH=./srcs

all: build up

build:
	mkdir -p /home/znogueir/data/mariadb
	mkdir -p /home/znogueir/data/wordpress
	docker compose -f $(DOCK_COMP_PATH)/docker-compose.yml build

up:
	docker compose -f $(DOCK_COMP_PATH)/docker-compose.yml up -d

down:
	sudo rm -rf /home/znogueir/data/mariadb/*
	sudo rm -rf /home/znogueir/data/wordpress/* 
	docker compose -f $(DOCK_COMP_PATH)/docker-compose.yml down

logs:
	docker compose -f $(DOCK_COMP_PATH)/docker-compose.yml logs

re: down all

.PHONY: all re build up down
