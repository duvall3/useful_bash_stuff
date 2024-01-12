README
================================

## template\_article

A simple LaTeX template for a scholarly journal article.
Requires a LaTeX distribution (tested on `texlive`).

## Terminal Preview

Note that the Makefile includes a `dvi` target, which compiles to `main.dvi` (instead of `main.pdf`).
This can be used with a tool such as `dvi2tty` (which is included in `texlive`) to preview
 a textual approximation of the final document rendered in the terminal.

Example:
```bash
make dvi
dvi2tty main.dvi
```

