\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
input jones-generic-star
beginfig(1);
  background := ivory;
  path S, W, M; numeric a,b,c,d,e;
  S = star(8, 2, 12) rotated 45/2;  % the common star macro
  z0 = a[point 2 of S, point 14 of S] = b[point 4 of S, point 8 of S];
  z1 = c[point 6 of S, point 10 of S] = d[point 4 of S, point 0 of S];
  z2 = e[point 6 of S, point 10 of S]; x2=x0;
  W = z2 -- z1 -- point 4 of S -- z0 -- cycle;
  M = W reflectedabout(origin, dir 45);
  picture tile; tile = image(
    fill S withcolor gold; 
    for i=0 upto 1:
      fill W rotated 180i withcolor forest;
      fill M rotated 180i withcolor forest;
      fill W rotated (90+180i) withcolor plum;
      fill M rotated (90+180i) withcolor plum;
    endfor
    drawoptions(withpen pencircle scaled 1 withcolor white);
      draw S;
      for i=0 upto 3:
        draw subpath (0, 3) of W rotated 90i;
        draw subpath (0, 3) of M rotated 90i;
      endfor
    drawoptions();
  );
  numeric u, v, grouting; grouting = -1;
  (u - grouting, v - grouting) = urcorner tile - llcorner tile;
  for i = 1 upto 8:   
    for j = 1 upto 5:
      draw tile if odd (i+j): rotated 90 fi shifted (i*u, j*v);
    endfor
  endfor
  picture p; p = currentpicture; unfill bbox p; draw p;
endfig;
\end{mplibcode}
\end{document}
