\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
  path lozenge, triangle, box;    
  lozenge = (left -- down -- right -- up -- cycle) 
    yscaled 1/3 rotated -45 scaled 21;
  interim bboxmargin := 0; box = bbox lozenge; 
  triangle = point 0 of box + 4 right -- point 1 of lozenge 
          -- point 0 of box + 4 up -- cycle;

  vardef paint_tile(expr s) = image(
    fill box withcolor ivory; 
    fill triangle withcolor gold; 
    fill triangle rotated 180 withcolor gold;
    fill lozenge withcolor s; 
  ) enddef;

  picture tile[];
  tile0 = paint_tile(lapiz);   tile2 = paint_tile(navy);
  tile1 = paint_tile(forest);  tile3 = paint_tile(lapiz);

  (u, v) = urcorner tile0 - llcorner tile0; 
  for i = 0 upto 11:
    for j = 0 upto 7:
      t := (floor (i/2) mod 2) + 2(floor (j/2) mod 2);
      draw tile[t] if odd (i+j): rotated 90 fi shifted (i*u, j*v);
    endfor
  endfor
endfig;
\end{mplibcode}
\end{document}

