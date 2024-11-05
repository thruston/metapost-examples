\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
input jones-generic-star
beginfig(1);
  numeric u; u = 10;
  path s; s = star(12, 4, u); 
  z0 = whatever[point 0 of s, point -8 of s] 
     = whatever[point 2 of s, point 10 of s];
  path t; t = star(12, 5, abs z0) rotated 15;
  path h; h = star(6, 1, 2.5u) rotated 30; 
  numeric a, b; (a, b) = h intersectiontimes 
                    subpath(0,-1) of t rotatedabout(point 0 of t, 180);
  path p; p = subpath(0,2) of t -- subpath (6-a, a-6) of h -- cycle;
  path r; r = (subpath(6-a, a-6) of h)
              reflectedabout(point 2-a/3 of h, point a/3-2 of h) rotated 30;
  path q; q = subpath(2,4) of t -- r -- cycle;

  vardef paint_tile(expr a, b) = image( 
    fill s withcolor navy;
    for i=0 upto 5:
      fill p rotated 60i withcolor if i mod 3 = 1: lapiz else: navy fi;
      fill q rotated 60i withcolor if i mod 3 = 2: a else: b fi;
    endfor
  ) enddef;
  picture rosette[]; 
  rosette0 = paint_tile(forest, gold);
  rosette1 = paint_tile(gold, forest);

  pair u, v; u = lrcorner rosette1 - llcorner rosette1; v = u rotated 60;
  for i=0 upto 7:
    for j=0 upto 5:
      draw rosette[j mod 2] shifted (i*u + j*v - floor(j/2)*u);
    endfor
  endfor
  picture P; P = currentpicture; fill bbox P withcolor ivory; draw P;
  clip currentpicture to
    unitsquare xscaled 13/2 xpart u yscaled 5 ypart v shifted 1/2 u;
endfig;
\end{mplibcode}
\end{document}

