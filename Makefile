.PHONY: help
.DEFAULT_GOAL := help
SHELL := /bin/bash

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

npm-install: ## install npm
	docker-compose run --rm nodejs npm install

help: ## command list
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
