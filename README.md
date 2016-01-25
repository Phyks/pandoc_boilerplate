Pandoc boilerplate
==================

Boilerplate to render scientific documents written in Markdown to LaTeX, using
Pandoc.

Includes various Pandoc filters:

* Automatically convert `SVG` files to `PDF` and rewrite the image link to
  include them in the document easily.

* Include [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref) for
  easy numbering and referencing.


## TODO

* automatically convertfunction names (cos, sin, exp, log) to their
LaTeX equivalent (\cos and so on) when in a mathematical environment,
then taking out the useless leading `\`.

* not having to use \frac{}{} to write fractions, but instead
automatically convert simple fractions in math environment to \frac{}{}
(for instance convert "(1 / 2)" to "\frac{1}{2}")

* anything else like this that could help writing more readable LaTeX
code :)
