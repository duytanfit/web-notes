# .env-example just for development
include .env-example

.PHONY: build migrate dev local-env local-env-down test

build:
	mkdir -p bin
	go build -o bin/web_notes cmd/web-notes/main.go

migrate:
	goose -dir migration postgres ${DB_STRING} up

dev: build
	./bin/web_notes
	
local-env:
	docker-compose up -d

local-env-down:
	docker-compose down

test:
	go test ./...
