Pandoc boilerplate
==================

Boilerplate to render scientific documents written in Markdown to LaTeX, using
Pandoc.

Includes various Pandoc filters:

* Automatically convert `SVG` files to `PDF` and rewrite the image link to
include them in the document easily.

* Include [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref) for
easy numbering and referencing.

* Include [asciimath](https://github.com/Kerl13/AsciiMath) for easy math typing.

* Include [pandoc-citeproc](https://github.com/jgm/pandoc-citeproc) for
  bibliography management and citation. See [this part of Pandoc
  README](http://pandoc.org/README.html#citations) as well for more infos on
  this.


## Dependencies

* `alex` and `happy`
