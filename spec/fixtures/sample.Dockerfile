# Assertions live in the comments: `<- scope` checks the marker's own column
# on the previous non-comment line, `^ scope` checks the caret's. Scopes
# match by prefix, so the trailing `.dockerfile` segment is left off.

FROM alpine:3.19 AS build
# <- keyword.control
#    ^ entity.name.type.image
#          ^ punctuation.separator.tag
#                ^ keyword.control
#                   ^ entity.name.type.stage

ARG VERSION=1.0
# <- keyword.control
#   ^ variable.other.member

EXPOSE 8080
# <- keyword.control
#      ^ constant.numeric

RUN echo "hello"
# <- keyword.control
#   ^ string.unquoted.shell

# a line comment
# <- punctuation.definition.comment
