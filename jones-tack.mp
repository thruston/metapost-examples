\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
  path tack;
  tack = (0,0) -- (0,2) -- (1,2) -- (1,1) -- (3,1);
  tack := tack rotated - angle point 4 of tack;
  tack := tack shifted -1/2 point 4 of tack;
  tack := tack -- subpath (3,0) of tack reflectedabout(left, right) -- cycle;
  tack := tack scaled 9;

  pair u, v; u = point 4 of tack - point 0 of tack; v = u rotated 90;

  background := ivory;
  for i=2 upto 15:
    for j=0 upto 6:
      path t; t = tack rotated (180 ((i+j) mod 2));
      pair z; z = i*u + j*v;
      fill t shifted z withcolor 
        if odd floor(i/2): if odd j: forest else: gold fi 
                     else: if odd j: gold   else: navy fi fi;
      draw t shifted z withpen pencircle scaled 1 withcolor white;
    endfor
  endfor
  picture P; P = currentpicture; clearit; unfill bbox P; draw P;
endfig;
\end{mplibcode}
\end{document}

