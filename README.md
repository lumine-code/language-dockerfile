# language-dockerfile

Dockerfile language support.

## Features

- **Grammars**: provides Tree-sitter grammars, built from [tree-sitter-dockerfile](https://github.com/camdencheek/tree-sitter-dockerfile).
- **Syntax highlighting**: instructions, image references split into name, tag and digest, build arguments and environment pairs.
- **Stages**: names a multi-stage build's stages so they can be jumped to.
- **Folding**: folds heredoc bodies.

## Installation

To install `language-dockerfile` search for it in the Install pane of the Lumine settings, or run the command `lumine --install lumine-code/language-dockerfile`.

## Usage

The body of a `RUN` is shell, which this grammar does not parse, so it is scoped as text rather than given a structure the parse cannot support.

## Injections

- Static Tree-sitter injections highlight URLs with `language-hyperlink`.
- Static Tree-sitter injections highlight comment markers with `language-todo`.

## Contributing

Got ideas to make this package better, found a bug, or want to help add new features? Just drop your thoughts on GitHub. Any feedback is welcome!
