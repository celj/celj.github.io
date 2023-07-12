help:
	@echo "build - build the resume"
	@echo "clean - clean up docker images"
	@echo "image - build the docker image"
	@echo "shell - run a shell in the docker image"
	@echo "update - clean, build, and image"

DIR := /app
IMAGE := resume

RUN := docker run --rm -it \
	-v `pwd`:$(DIR) \
	$(IMAGE)

build:
	$(RUN) xelatex -interaction=nonstopmode Carlos\ Lezama.tex; git clean -Xdf

clean:
	docker image prune -f

image:
	docker build -t $(IMAGE) .

shell:
	$(RUN) /bin/bash
