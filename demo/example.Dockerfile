FROM alpine:3.19 AS build

ARG VERSION=1.0

EXPOSE 8080

RUN echo "hello"

# a line comment
