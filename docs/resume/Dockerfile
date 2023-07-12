FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get -y install git texlive-xetex texlive-fonts-extra

WORKDIR /app

COPY . .