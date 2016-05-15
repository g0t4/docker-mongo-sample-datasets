.PHONY: build run run_attached shell

NAME=mongo-sample-datasets
VERSION=dev
IMAGE_NAME=$(NAME):$(VERSION)
HOST_PORT=27017

build:
	docker build --rm -t $(IMAGE_NAME) . 

run:
	-docker rm -f -v $(NAME) 
	docker run -d -p $(HOST_PORT):27017 --name=$(NAME) $(IMAGE_NAME) 

run_attached:
	-docker rm -f -v $(NAME) 
	docker run -p $(HOST_PORT):27017 --name=$(NAME) $(IMAGE_NAME) 	

shell:
	docker run -it $(IMAGE_NAME) bash

