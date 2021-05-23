# metapost-examples

Some example documents and drawings, showing off what you can do with Metapost and `luamplib`.

## PWW-1 and PWW-2

These two documents are attempts to re-draw some of the drawings from Roger Nelsen's "Proofs
without words" books.  The intent is to provide a tutorial to drawing with plain
Metapost, as well as to show what can be done with `mplib` and `lualatex`.  The
source of each PDF files is a single tex file with each drawing as a separate
`mplib` environment.  The files use a few external Metapost files, that include:

- `arrow_label.mp` -- draws a double arrow with a label in the middle
- `isometric-projection.mp` -- for simple 3D
- `mark_equal.mp` -- draws equal-line pecks
- `markle.mp` -- draws angle marks
- `paintball.mp` -- draws slightly-solid balls
- `thatch.mp` -- a simple hatching routine

You will also need the `metapost-colorbrewer` package installed, and the TeX
Gyre Pagella and TeX Gyre Pagella Math fonts installed and available to
`fontspec`.

The documents are strictly for educational and tutorial purposes only.  All the
original books and therefore all the pictures are copyrighted by the
Mathematical Association of America. My Metapost source files are covered by
the GNU Public License V3.  This means you can use them for any non-commercial
purpose.

## Tutorial Examples

For this one, I have chosen examples from various sources, that may be familiar from
elsewhere in the world of \TeX.

## Contact / questions

If you have questions about Metapost or any of my examples, please consider asking
them on a Q&A site like http://tex.stackexchange.com/ using the `metapost` tag.
