FROM ubuntu

WORKDIR /root/.dotfiles

RUN apt-get update && apt-get install -y curl git vim zsh python3
COPY . .

ENV TERM xterm-256color

CMD ["./setup"]
