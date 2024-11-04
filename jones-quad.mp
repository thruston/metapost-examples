\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
  numeric u, r; u = 33; r = sqrt(1/2);   
  path s; s = unitsquare shifted -(1/2, 1/2) scaled u;
  path o; o = for i=0 upto 7: point r of s rotated 45i -- endfor cycle; 
  path c; c = for i=0 upto 3: 
    (subpath (0, 1-r) of o --
    point 0 of o rotatedabout(point 1 of s, -45) --
    subpath (r, 1) of o) rotated 90i -- 
  endfor cycle;

  vardef tile(expr fg, bg) = image(
    fill s withcolor bg;
    fill c withcolor fg;
    draw s withpen pencircle scaled 1 withcolor 31/32;
    draw c withpen pencircle scaled 1 withcolor 31/32;
  ) enddef;

  for i=1 upto 13:
    for j=1 upto 8:
      draw if odd (i+j): 
        tile(navy, ivory) 
      else: 
        tile(gold, forest) 
      fi shifted (i*u, j*u);
    endfor
  endfor
endfig;
\end{mplibcode}
\end{document}
