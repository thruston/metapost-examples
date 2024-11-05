\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
input jones-generic-star
beginfig(1); 
  numeric r[]; r0 = 19; r1 = 14;
  z0 = origin;
  z1 = (r0 + r1) * up;

  path t, n, m; % twelve-gon, and nine-gons
  t = (for i=0 upto 11: up rotated 30i -- endfor cycle) scaled r0 rotated -30;
  n = (for i=0 upto 8: down rotated 40i -- endfor cycle) scaled r1 shifted z1;
  m := n reflectedabout(origin, point 0 of t);
  z2 = z1 reflectedabout(origin, point 0 of t);

  path p; pair a, b, c, d, e;
  a = whatever[point 1 of n, point 2 of n] = whatever[point 0 of t, point 1 of t];
  b = whatever[point 1 of m, point 2 of m] = whatever[point 0 of t, point -1 of t];
  c = whatever[a, b rotated 180] = whatever[b rotated 30, a rotated 210];
  d = whatever[b, a rotated 180] = whatever[a rotated -30, b rotated 150];
  e = whatever[b rotated 30, a rotated 210]
    = whatever[a rotated -30, b rotated 150];
  p = (point 0 of t -- a -- c -- e -- d -- b -- cycle) rotated 30;
  for i=1 upto 12:
    fill p rotated 30i withcolor navy;
  endfor
  fill star(12, 4, abs point 3 of p) withcolor gold;

  path q, s; pair a, b, c, d, e;
  a = whatever[point 0 of n, point 1 of n] = whatever[point -1 of p, point -2 of p];
  b = whatever[point 0 of n, point -1 of n] = whatever[point 1 of p, point 2 of p];
  c = whatever[a, b rotatedabout(z1, 180)] 
    = whatever[b rotatedabout(z1, 40), a rotatedabout(z1, 220)];
  d = whatever[b, a rotatedabout(z1, 180)]
    = whatever[a rotatedabout(z1, -40), b rotatedabout(z1, 140)];
  e = whatever[b rotatedabout(z1, 40), a rotatedabout(z1, 220)]
    = whatever[a rotatedabout(z1, -40), b rotatedabout(z1, 140)];
  q = point 0 of n -- a -- c -- e -- d -- b -- cycle;
  s = q rotated -60;
  
  for i=1 upto 9: 
    fill q rotatedabout(z1, 40i) withcolor forest; 
    fill s rotatedabout(z2, 40i) withcolor lapiz; 
  endfor;
  fill star(9, 3, abs (point 3 of q - z1)) rotated 20 shifted z1 withcolor gold;
  fill star(9, 3, abs (point 3 of q - z1)) shifted z2 withcolor gold;

  path g; pair a;
  a = whatever[point 1 of n, point 2 of m] = whatever[point 1 of m, point 2 of n];
  g = subpath (-2, 2) of q rotated -30 -- a -- cycle;
  for i=-1 upto 1: for r=0, 180:
    fill g rotatedabout(a, r) rotated 60i withcolor plum;
  endfor endfor

  picture unit; unit = currentpicture; clearit;
  pair u, v; u = point 6 of m - point 3 of t; v = u rotated 60;
  for i=0 upto 7:
    for j=0 upto 5:
      draw unit shifted (i * u + j * v - floor(j/2) * u) ;
    endfor
  endfor

  background := ivory;
  picture P; P = currentpicture; unfill bbox P; draw P;
  clip currentpicture to unitsquare xscaled 7 xpart u yscaled 5 ypart v shifted z2;
endfig;
\end{mplibcode}
\end{document}
