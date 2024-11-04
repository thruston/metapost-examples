\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
  path bat;
  bat = (0,0)--(1,1)--(5,1)--(3,3)--(1,3)--(1,5)--(0,4)-- 
        (-1,5)--(-1,3)--(-3,3)--(-5,1)--(-1,1)--cycle;
  vardef unit(expr shade) = image(for t=0, 180:
    fill bat scaled 3.6 rotated t withcolor shade;
  endfor) enddef;       
  picture tile[]; tile0 = unit(navy); tile1 = unit(forest) rotated 90;
  numeric u, v; (u,v) = urcorner tile0 - llcorner tile0;
  for i=1 upto 8:
    for j=1 upto 5:
      draw tile[(i+j) mod 2] shifted (i*u,j*v);
    endfor
  endfor
  picture p; p = currentpicture; fill bbox p withcolor ivory; draw p;
endfig;
\end{mplibcode}
\end{document}
