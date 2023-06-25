help:
	@echo "build - build the site"
	@echo "clean - remove the site"
	@echo "image - build the docker image"
	@echo "serve - serve the site"
	@echo "shell - run a shell in the container"
	@echo "update - clean, build, and serve the site"

DIR := /srv/jekyll
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
	rm -rf ./docs

image:
	docker build --no-cache -t $(IMAGE) .

serve:
	$(RUN) bundle exec jekyll serve \
	-H $(HOST) \
	-P $(PORT) \
	--future

shell:
	$(RUN) /bin/bash

update: clean image build