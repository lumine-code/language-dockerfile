[
  "FROM"
  "AS"
  "RUN"
  "CMD"
  "LABEL"
  "EXPOSE"
  "ENV"
  "ADD"
  "COPY"
  "ENTRYPOINT"
  "VOLUME"
  "USER"
  "WORKDIR"
  "ARG"
  "ONBUILD"
  "STOPSIGNAL"
  "HEALTHCHECK"
  "SHELL"
  "MAINTAINER"
  "CROSS_BUILD"
] @keyword.control.dockerfile

(image_spec
  (image_tag
    ":" @punctuation.separator.tag.dockerfile))
(image_spec
  (image_digest
    "@" @punctuation.separator.digest.dockerfile))

(comment) @comment.line.number-sign.dockerfile
((comment) @punctuation.definition.comment.dockerfile
  (#set! adjust.endAfterFirstMatchOf "^#"))



(double_quoted_string) @string.quoted.double.dockerfile

[
  (heredoc_marker)
  (heredoc_end)
] @entity.name.label.dockerfile

; A heredoc body is raw text, not a quoted string.
(heredoc_block
  (heredoc_line) @string.unquoted.heredoc.dockerfile)

(expansion
  "$" @punctuation.definition.variable.dockerfile)
(expansion
  "{" @punctuation.definition.variable.begin.dockerfile
  "}" @punctuation.definition.variable.end.dockerfile)

((variable) @constant.other.dockerfile
  (#match? @constant.other.dockerfile "^[A-Z][A-Z_0-9]*$"))

(arg_instruction
  .
  (unquoted_string) @variable.other.member.dockerfile)

(env_instruction
  (env_pair
    .
    (unquoted_string) @variable.other.member.dockerfile))

(expose_instruction
  (expose_port) @constant.numeric.dockerfile)

(image_spec
  (image_name) @entity.name.type.image.dockerfile)
(image_spec
  (image_tag
    (_) @constant.other.tag.dockerfile))
(image_alias) @entity.name.type.stage.dockerfile

; The body of a RUN is shell, which this grammar does not parse; scoping it as
; anything more specific than text would be a claim the parse cannot support.
(shell_fragment) @string.unquoted.shell.dockerfile
