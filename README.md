# metapost-examples

Some example documents and drawings, showing off what you can do with Metapost and
`luamplib`.  My TeX / Metapost source files are covered by the GNU Public License V3.
This means you can use them for any non-commercial purpose.

## PWW-1 and PWW-2

These two documents are attempts to re-draw some of the drawings from Roger Nelsen's "Proofs
without words" books. 

- `pww-1.tex`
- `pww-2.tex`

The intent is to provide a tutorial to drawing with plain
Metapost, as well as to show what can be done with `mplib` and `lualatex`.  The
source of each PDF files is a single tex file with each drawing as a separate
`mplib` environment.  The files use a few external Metapost files, that include:

- `arrow_label.mp` -- draws a double arrow with a label in the middle
- `isometric-projection.mp` -- for simple 3D
- `mark_equal.mp` -- draws equal-line pecks
- `markle.mp` -- draws angle marks
- `paintball.mp` -- draws slightly-solid balls
- `thatch.mp` -- a simple hatching routine

You will also need the `metapost-colorbrewer` package installed (this is part of any
full TeX distribution), and the TeX Gyre Pagella and TeX Gyre Pagella Math fonts
installed and available to `fontspec`.

The documents are strictly for educational and tutorial purposes only.  All the
original books and therefore all the pictures are copyrighted by the
Mathematical Association of America.

# Excursions

This document has drawings and notes (about the drawings) inspired by Stanley
Ogilvie's "Excursions in Geometry".  The drawings are mainly about the geometry of
the circle, and techniques of inversion.  This file is a self-contained lualatex
source file, with each drawing included in-line.  You might like to read the source
in parallel to the output. 

- `excursions.tex`

## Tutorial Examples

For this one, I have chosen examples from various sources, that may be familiar from
elsewhere in the world of \TeX.

## Contact / questions

If you have questions about Metapost or any of my examples, please consider asking
them on a Q&A site like http://tex.stackexchange.com/ using the `metapost` tag.
