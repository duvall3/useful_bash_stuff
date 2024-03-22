# README -- md2html

---

Copyright (C) 2024 Mark J. Duvall / T. Rocks Science

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

**A copy of the GPL is provided at [../../LICENSE](../../LICENSE)**

---

## OVERVIEW

### Description

The program *<mark>md2html</mark>* is a tool for generating nicely-formatted, easily-readable HTML documents from [Markdown](https://www.markdownguide.org/) files.
This is both much easier and much faster than writing HTML by hand.

The conversion itself is performed by the wonderful [Pandoc](https://pandoc.org/) program; <mark>md2html</mark> is essentially a wrapper script that provides enhancements to <mark>pandoc</mark> and supplies options and arguments, including style definitions.

The biggest enhancement is a facility for convenient manual syntax highlighting in the *body* of the Markdown text (syntax highlighting in code blocks is provided automatically by <mark>pandoc</mark>). The colors have been selected to approximately match <mark>pandoc</mark>'s automatic highlighting.

### Notes
- *<mark>md2html</mark>* is a part of [Useful BASH Stuff](https://github.com/duvall3/useful_bash_stuff/)
- Credit for the GitHub "Darkdown" theme goes to Kevin Burke
- *If you are reading this within GitHub*, some items will not render correctly; try viewing [this version](http://trocksscience.com/md2html/README.html) instead.

---


## USAGE

### Invocation

```bash
md2html [-h] [-o <OUTFILE>] [-t <TITLE>] <FILENAME>
```
```
Convert a Markdown file to HTML.
Options:
  -h	Show this help message and exit
  -o	OUTFILE		Set output filename
  -t	TITLE		Set title of output HTML page
```


### Manual Highlighting

*Note: See [README.md](README.md) to view the source
  for the examples here.*<br>
This is used in the body of the Markdown file to format 
  words or phrases of code <mark>like this</mark>, or
<mark class="pad">indented code sections like this.</mark>
Highlighting works <mark class="var">like 
  </mark><mark class="str">this</mark>, and
  highlighting within indented sections
<mark class="pad">
  works<br>
  <mark class="var">like</mark><br>
  <mark class="str">this</mark>.
</mark>
As stated above, highlighting within Markdown code blocks
  (as opposed to the regular body environment) is provided
  automagically by <mark>pandoc</mark>, as in the
  <mark>BASH</mark> example shown here:

```bash
cd $HOME/Documents
declare PI=3.14
echo $PI
echo 'Hello, world!'
```

### Highlight Classes

| Class					| Intended Use		|
| ------------------------------------- | --------------------- |
| *<mark>none</mark>*			| general code		|
| <mark>pad</mark>			| indented code block	|
| <mark class="command">command</mark>	| shell commands	|
| <mark class="var">var</mark>		| variable names	|
| <mark class="const">const</mark>	| numeric constanst	|
| <mark class="str">str</mark>		| character strings	|


*Notes:*

- Users can modify these defaults or add their own classes by editing <mark>github-darkdown-additional.css</mark> in this directory.
- All class tags except the basic `mark` have the following syntax:
```html
<mark class="CLASSNAME">Highlighted Text</mark>
```

---

## EXAMPLES

### Basic Example -- Both Manual (<mark>md2html</mark>) and Automatic (<mark>pandoc</mark>)

If <mark>md2html</mark> is run on a Markdown file containing the literal
  Markdown source below marked <mark>INPUT</mark>, it should produce
  an output HTML file that will render as in the section marked
  <mark>OUTPUT</mark>.

INPUT:<br>
````
First, <mark class="command">cd</mark> into your
  <mark class="var">$HOME</mark> directory, then set the values
  of <mark class="var">PI</mark> and <mark class="var">FILENAME</mark>
  to <mark class="const">3.14</mark> and <mark class="str">"test.txt"</mark>,
  respectively, as follows:
```bash
cd $HOME
PI=3.14
FILENAME="test.txt"
```
````

OUTPUT:<br>
First, <mark class="command">cd</mark> into your <mark class="var">$HOME</mark> directory, then set the values of <mark class="var">PI</mark> and <mark class="var">FILENAME</mark> to <mark class="const">3.14</mark> and <mark class="str">"test.txt"</mark>, respectively:
```bash
cd $HOME
PI=3.14
FILENAME="test.txt"
```

### Further Examples

This README was itself created using <mark>md2html</mark>,
  so see the source file [README.md](README.md)
  for additional examples of usage.

---

## Closing Thoughts

This program was primarily created for writing software READMEs and tutorials, and it will probably be most useful as such.
However, it could be helpful any time you want to generate a simple HTML document with class-based color highlighting.
I'd be delighted to hear about any uses you find for it.
Questions and comments are welcome at [duvall3 dot git at gmail dot com](mailto:duvall3.git@gmail.com) or [mark at trocksscience dot com](mailto:mark@trocksscience.com).

Happy hacking!<br>
-- MJD

---

*Last updated 2024-03-22*
