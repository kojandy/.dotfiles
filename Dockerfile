FROM ubuntu

WORKDIR /root

RUN apt-get update && apt-get install -y curl git vim zsh python3
COPY . ./.dotfiles/

ENV TERM xterm-256color
