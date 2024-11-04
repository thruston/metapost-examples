\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
input jones-generic-star
beginfig(1);
  background := ivory;
  path o; o = for i=0 upto 7: 48 dir (45i + 45/2) -- endfor cycle;
  fill o withcolor navy;
  numeric r, s; r = 3; s = 13; pair q; q = (s,s) scaled sqrt(1/2);
  path t; t = (up -- origin -- right) scaled s;
  path u; u = (down * s -- up * r -- right * r -- left * s);
  path leaf; leaf = t shifted q -- 
                    u shifted (point 1/2 of o - 1/2(r,r)) -- cycle;
  for i=0 upto 7:
    unfilldraw leaf rotated 45i withpen pencircle scaled 1/4;
  endfor
  path v; v = star(8,2,s); % same macro as "octa-star" uses
  fill v withcolor gold; undraw v;
  path w; w = (origin -- subpath(4,8) of v -- cycle)
              shifted (xpart point 0 of o, ypart point 1 of o) shifted q;
  path p; p = point 0 of o -- point 5 of w shifted (q rotated 180) --
              point 5 of w -- point 0 of o shifted (q rotated -90) -- cycle;
  for i=0 upto 3:
    filldraw w rotated 90i withcolor navy;
    filldraw p rotated 90i withcolor plum;
    filldraw p reflectedabout(left, right) rotated 90i withcolor plum;
  endfor

  picture unit; unit = currentpicture; clearit;
  numeric u, v; (u,v) = urcorner unit - llcorner unit;
  for i=1 upto 5: for j = 1 upto 3:
    draw unit shifted (i*u, j*v);
  endfor endfor
  picture P; P = currentpicture; clearit;
  P := P scaled (396 / xpart (urcorner P - llcorner P));
  unfill bbox P; draw P;
endfig;
\end{mplibcode}
\end{document}
