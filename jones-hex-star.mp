\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
  numeric r; r = sqrt(1/3);
  path t; t = (r * dir   0 {dir  60} .. {dir 120} 2r * dir  60 {dir 240} 
            .. r * dir 120 {dir 180} .. {dir 240} 2r * dir 180 {dir 360}
            .. r * dir 240 {dir 300} .. {dir 360} 2r * dir 300 {dir 120}
            .. cycle) rotated -30 scaled 21;
  numeric a; (a, whatever) = t intersectiontimes (origin -- infinity * up);
  path h; h = for i=0 upto 5: point a of t rotated 60i -- endfor cycle;
  path t'; t' = t rotatedabout(point 1 of t, 60);
  path h'; h' = h rotatedabout(point 1 of t, 60);
  path s; s = for i=0 upto 5:
    point i of h' -- 1/3[point i of h', point i+2 of h'] --
  endfor cycle;
  vardef unit(expr a, b) = image(
    fill t withcolor a; fill h withcolor 15/16 ivory;
    fill t' withcolor ivory; fill s withcolor b;
    drawoptions(withpen pencircle scaled 1 withcolor 15/16);
      draw t; draw t'; draw h; draw s;
    drawoptions();
  ) enddef;
  pair u, v; u = origin rotatedabout(point 1 of t, 120); v = u rotated -60; 
  numeric n; n = 6;
  for i = -n upto n:
    for j = -n upto n:
      draw unit(if odd (i+j): navy else: forest fi, 
        if odd (i+j): gold else: lapiz fi)
        shifted (i*u + j*v); 
    endfor
  endfor
  clip currentpicture to unitsquare shifted -(1/2,1/2) scaled 5in yscaled 0.618;
endfig;
\end{mplibcode}
\end{document}
