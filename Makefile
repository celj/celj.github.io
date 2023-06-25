DIR := /usr/app
IMAGE := celj.github.io

image:
	docker build -t $(IMAGE) .

build:
	docker run --rm -it -v `pwd`:$(APP_DIR) --publish [::1]:8080:8080 $(IMAGE) bundle exec jekyll build -d ./docs --future

serve:
	docker run --rm -it -v `pwd`:$(APP_DIR) --publish [::1]:8080:8080 $(IMAGE) bundle exec jekyll serve --future