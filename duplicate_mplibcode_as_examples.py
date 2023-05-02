#! /usr/bin/env python3

import argparse
import fileinput
import sys

parser = argparse.ArgumentParser()
parser.add_argument("tex_source", help="TeX Source filename")
args = parser.parse_args()

chunks = []
buffer = []
chapter_counter = 0
for line in fileinput.input(files=args.tex_source):
    line = line.rstrip()
    if not line:
        continue

    # if line.startswith('%'):
        # continue

    if line == r'\usepackage{luamplib}':
        line = '\\usepackage{luamplib}\n\\usepackage{dwmpcode}'

    if line.startswith(r'\contrib'):
        buffer.append(line)
        chunks.append("\n".join(buffer))
        buffer.clear()

    elif line.startswith(r'\section{'):
        if buffer:
            chunks.append("\n".join(buffer))
            buffer.clear()
        buffer.append(line)

    elif line.startswith(r'\chapter{'):
        if buffer:
            chunks.append("\n".join(buffer))
            buffer.clear()
        chapter_counter += 1
        if chapter_counter > 1:
            buffer.append(r"\makeatletter\ifodd\c@page\clearpage\hbox{}\fi\makeatother")
        buffer.append(line)

    else:
        buffer.append(line)

if buffer:
    chunks.append("\n".join(buffer))

def get_mplibcode(lines):
    '''find the contents of the mplibcode environment'''
    mp = []
    capture = False
    for line in lines:
        if line.startswith(r'\begin{mplibcode}'):
            capture = True
        elif line.startswith(r'\end{mplibcode}'):
            capture = False
        elif line.strip().startswith(r'% DUMP '):
            k = eval(f"dict({line.strip()[7:]})")
            if "capture" in k:
                capture = k["capture"]
            if "replace" in k:
                mp.append(k["replace"])
        elif capture:
            mp.append(line)
    return '\n'.join(mp)

for i, c in enumerate(chunks):
    if c.startswith(r'\section'):
        mpcode = get_mplibcode(c.splitlines())
        print(rf'''\clearpage
\vbox to\textheight{{\vss\begin{{smallcode}}[xleftmargin=-16pt,xrightmargin=-80pt]
{mpcode}
\end{{smallcode}}\vss}}''')
    print(c)



