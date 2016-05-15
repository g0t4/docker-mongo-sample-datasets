.PHONY: build run run_attached shell help compose

NAME=mongo-sample-datasets
VERSION=dev
IMAGE_NAME=$(NAME):$(VERSION)
HOST_PORT=27017

build: ## build image 
	docker build --rm -t $(IMAGE_NAME) . 

run: ## run detached
	-docker rm -f -v $(NAME) 
	docker run -d -p $(HOST_PORT):27017 --name=$(NAME) $(IMAGE_NAME) 

run_attached: ## run attached for viewing logs and troubleshooting
	-docker rm -f -v $(NAME) 
	docker run -p $(HOST_PORT):27017 --name=$(NAME) $(IMAGE_NAME) 	

shell: ## open bash shell into container
	docker run -it $(IMAGE_NAME) bash

compose: ## Run docker-compose up in attached mode, Ctrl+C to end, after which cleanup will take place with docker-compse rm
	docker-compose up 
	docker-compose rm -fva

help:
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

