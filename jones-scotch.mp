\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
  background := ivory;
  numeric r; r = sqrt(2)-1; 
  path s; s = (0, r-1) -- (r, -1) -- (1, -1) -- (1, -3) -- (0, -4);
  path t; t = (0, -4) -- (1, -3) -- (3, -3) -- (3, r-4) -- (3-r, -4);
  s := s -- subpath (3,1) of s reflectedabout(up, down) -- cycle;
  t := t -- subpath (4,1) of t reflectedabout(up, down) -- cycle;

  numeric u; 4u = 24;
  s := s scaled u;
  t := t scaled u;

  vardef unit(expr shade) = image(for i=0 upto 3:
    filldraw t rotated 90i withcolor navy;
    fill s rotated 90i withcolor shade;
    draw s rotated 90i withpen pencircle scaled 1 withcolor 15/16;
  endfor) enddef;

  for i=2 upto 9:
    for j=2 upto 7:
      color shade; shade = 
      if odd floor(i/2): if odd floor(j/2): lapiz else: forest fi
                   else: if odd floor(j/2): forest else: gold fi fi;
      draw unit(shade) shifted ((i, j) scaled 8u);
    endfor
  endfor

  picture P; P = currentpicture;clearit; unfill bbox P; draw P;
endfig;
\end{mplibcode}
\end{document}
