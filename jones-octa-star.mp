\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
input jones-generic-star
beginfig(1);
  background := ivory;
  path cross; cross = star(8,2,16);
  numeric u, v; (u, v) = urcorner cross - llcorner cross;
  for i=-6 upto 6:
    for j=-3 upto 3:
      pair z; z = (i*u, j*v);
      numeric k; k = j + floor ((i + abs j) / (1 + 2 abs j));
      fill cross shifted z withcolor if odd k: forest else: lapiz fi;
      draw cross shifted z withpen pencircle scaled 1 withcolor white;
    endfor
  endfor
  picture P; P = currentpicture; unfill bbox P; draw P;
endfig;
\end{mplibcode}
\end{document}
