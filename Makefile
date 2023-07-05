help:
	@echo "build - build the site"
	@echo "clean - clean up docker images"
	@echo "image - build the docker image"
	@echo "serve - serve the site"
	@echo "shell - run a shell in the container"

DIR := /app
HOST := 0.0.0.0
IMAGE := celj.github.io
PORT := 8080

RUN := docker run --rm -it \
	-p $(PORT):$(PORT) \
	-v `pwd`:$(DIR) \
	$(IMAGE)

build:
	$(RUN) bundle exec jekyll build \
	-d ./docs \
	--future

clean:
	docker image prune -f

image:
	docker build -t $(IMAGE) .

serve:
	$(RUN) bundle exec jekyll serve \
	-H $(HOST) \
	-P $(PORT) \
	--future

shell:
	$(RUN) /bin/bash
