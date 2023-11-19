DOCK_COMP_PATH=./srcs

all: build up

build:
	mkdir -p /home/znogueir/data/mariadb
	mkdir -p /home/znogueir/data/wordpress
	docker compose -f $(DOCK_COMP_PATH)/docker-compose.yml build

up:
	docker compose -f $(DOCK_COMP_PATH)/docker-compose.yml up -d

down:
	docker compose -f $(DOCK_COMP_PATH)/docker-compose.yml down --rmi all

clean: down
	sudo rm -rf /home/znogueir/data/mariadb/*
	sudo rm -rf /home/znogueir/data/wordpress/*

img_clean:
	docker image rm nginx:latest mariadb:latest wordpress:latest

fclean: clean

logs:
	docker compose -f $(DOCK_COMP_PATH)/docker-compose.yml logs

re_up: down all

re: fclean all

.PHONY: all re build up down
