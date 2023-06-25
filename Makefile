help:
	@echo "image - build docker image"
	@echo "build - build site"
	@echo "serve - serve site"

DIR := /srv/jekyll
IMAGE := celj.github.io
PORT := 4000

DOCKER_RUN := docker run --rm -it -v `pwd`:$(DIR) --publish [::1]:$(PORT):$(PORT) $(IMAGE)

image:
	docker build --no-cache -t $(IMAGE) .

build:
	$(DOCKER_RUN) bundle exec jekyll build -d ./docs --future

serve:
	$(DOCKER_RUN) bundle exec jekyll serve --future

retry: image serve