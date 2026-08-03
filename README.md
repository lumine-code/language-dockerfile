# language-dockerfile

Dockerfile language support.

## Features

- **Grammars**: provides Tree-sitter grammars, built from [tree-sitter-dockerfile](https://github.com/camdencheek/tree-sitter-dockerfile).
- **Syntax highlighting**: instructions, image references split into name, tag and digest, build arguments and environment pairs.
- **Stages**: names a multi-stage build's stages so they can be jumped to.
- **Folding**: folds heredoc bodies.

## Usage

The body of a `RUN` is shell, which this grammar does not parse, so it is scoped as text rather than given a structure the parse cannot support.

## Services

- **hyperlink.injection** (`^1.0.0`): consumed to highlight URLs inside Dockerfiles as clickable links.
- **todo.injection** (`^1.0.0`): consumed to highlight `TODO`-style markers inside comments.

## Contributing

Got ideas to make this package better, found a bug, or want to help add new features? Just drop your thoughts on GitHub. Any feedback is welcome!
