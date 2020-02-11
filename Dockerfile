FROM debian:buster

RUN apt-get update && apt-get install -y yamllint ansible-lint
