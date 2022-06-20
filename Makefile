#!make
include .env
export $(shell sed 's/=.*//' .env)

dep:
	@cd server && go mod tidy

binaries: dep
	@cd server && go build -o ../bin/silmarillion-server

image: binaries
	@docker build -t silmarillion-server .

logs: ## Logs the backend
	@docker logs -f shepherd_server


# Methods for developers
container-run: image #Runs the server container with docker. Does not attach a database or proxy.
	@docker run -d -p ${SERVER_PORT}:${SERVER_PORT}  --rm silmarillion-server


up-dev: #Takes the most recent image and runs through terraform.
	@echo "Did you build the most recent image?"
	@cd terraform/local && terraform init && terraform apply -auto-approve

down-dev:
	@cd terraform/local && terraform destroy -auto-approve

