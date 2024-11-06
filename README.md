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

These documents are strictly for educational and tutorial purposes only.  All
the original books and therefore all the pictures are copyrighted by the
Mathematical Association of America.

Each document contains over 100 fairly complex Metapost drawings, and on my Mac Mini (M2 2023)
it takes about 4 seconds to compile each one, or roughly 25-30 full page drawings
per second.  Your mileage may vary. 

You can view each document in three ways:

- You can just admire the PDF versions: pww-1.pdf and pww-2.pdf

- You could open the corresponding TeX file in your editor, and browse 
  the source and the corresponding PDF output side by side

- Or you can read the "parallel" versions.  

These parallel versions are generated from the same LuaLaTeX source
files by the Python script that it included in the source

- `duplicate_mplibcode_as_examples.py`

This script is not very general, it is depends on the particular structure
that I use for these document, but it will generate a "parallel code" version
that shows the MP source on the left and the MP image on the right of each double page
spread.  These parallel PDFs are probably best viewed on a large screen
with a PDD viewer that lets you show two pages side by side.  The parallel files
are 

- `pww-1-parallel.pdf`
- `pww-2-parallel.pdf`

The code colouring is done using the included `dwmpcode.sty` style file.

## Excursions

This document has drawings and notes (about the drawings) inspired by Stanley
Ogilvie's "Excursions in Geometry".  The drawings are mainly about the geometry of
the circle, and techniques of inversion.  This file is a self-contained lualatex
source file, with each drawing included in-line.  You might like to read the source
in parallel to the output. 

- `excursions.tex`

## Cosmopolitan Tiling

Geometric tiling patterns -- Moorish, Islamic, Roman -- are a minor obsession of mine,
and Metapost is a great tool for exploring them.  This file present many examples, 
with minimal notes on techniques.  Like the others, this file is a self-contained 
`lualatex` source file, showing what can be done with `luamplib` and different
instances of MP in one file.

- `cosmos.tex`
- `cosmos.pdf`

## Contact / questions

If you have questions about Metapost or any of my examples, please consider asking
them on a Q&A site like http://tex.stackexchange.com/ using the `metapost` tag.
