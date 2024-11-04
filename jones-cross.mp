\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
  path cross;
  numeric r, t; t = 2; r = t-sqrt(2);
  cross = (for i=0 upto 3:
    ((t,0) -- (t-r, r) -- (r, r) -- (r, t-r)) rotated 90i --
  endfor cycle) scaled 9.6;

  pair u, v;
  u = point 0 of cross - point 8 of cross;
  v = point 4 of cross - point 12 of cross;
  n = 4;
  for i=-n upto n:
    for j=-n upto n:
      k := j + floor ((i + abs(j)) / (2 abs(j) + 1));
      fill cross shifted (i*u+j*v) 
        withcolor if odd k: forest else: navy fi;
      draw cross shifted (i*u+j*v) 
        withpen pencircle scaled 3 withcolor 1/2[ivory, white];
    endfor
  endfor
  picture P; P = currentpicture; fill bbox P withcolor ivory; draw P;
endfig;
\end{mplibcode}
\end{document}
