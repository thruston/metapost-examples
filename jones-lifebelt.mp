\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
  background := ivory;
  numeric u; u = 10;
  path s; s = unitsquare scaled u shifted 1/2(3u, -u) rotated 45;
  path t; t = subpath (2,3) of s -- subpath (0,1) of s rotated 90 -- cycle; 
  picture unit; unit = image(
    pickup pencircle scaled 1;
    for i=0 upto 3:
      fill s rotated 90i withcolor navy;
      fill t rotated 90i withcolor gold;
    endfor
    for i=0 upto 3:
      undraw s rotated 90i;
      undraw subpath (1,2) of t rotated 90i;
    endfor
    pickup defaultpen;
  );
  numeric u, v; (u,v) = urcorner unit - llcorner unit; 
  for i=0 upto 8:
    for j= 0 upto 5:
      draw unit shifted (i*u, j*v);
    endfor
  endfor
  picture P; P = currentpicture; unfill bbox P; draw P;
  begingroup;  interim bboxmargin := -1/2 u;
  clip currentpicture to bbox currentpicture;
  endgroup;
endfig;
\end{mplibcode}
\end{document}
