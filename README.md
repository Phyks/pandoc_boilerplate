Pandoc boilerplate
==================

Boilerplate to render scientific documents written in Markdown to LaTeX, using
Pandoc.

Includes various Pandoc filters:

* Automatically convert `SVG` files to `PDF` and rewrite the image link to
include them in the document easily.

* Include [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref) for
easy numbering and referencing.

* Convert simple fractions like "(n / k)" to LaTeX's "\\frac{n}{k}" when n and
k are integers in a math environment.

* automatically convert function names (cos, sin, exp, log) to their
LaTeX equivalent (\\cos and so on) when in a mathematical environment,
then taking out the useless leading `\`.

## TODO

* anything else like this that could help writing more readable LaTeX
code :)
