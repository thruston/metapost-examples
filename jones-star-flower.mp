\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
input jones-generic-star
beginfig(1);
  background := ivory;
  path s, t, a, b;
  s = star(8, 2, 8) rotated -45/2;  % the common star macro
  z0 = whatever[point  4 of s, point  0 of s] 
     = whatever[point 14 of s, point 10 of s]; 
  t = (origin -- subpath (-3, 1) of s -- cycle) rotatedabout(z0, 180);
  z1 = whatever[point 2 of s, point 6 of s]
     = whatever[point 8 of s rotatedabout(z0, 180), 
                                         point 12 of s rotatedabout(z0, 180)];
  a = point 0 of s -- z0 -- point 2 of t -- z0 rotatedabout(point 0 of t, -45)
      -- z1 -- z0 rotated 45 -- cycle;
  b = a reflectedabout(up, down);
  
  picture tile[]; numeric n; n = -1;
  forsuffixes $=forest, navy:
    tile[incr n] = image(
      fill s withcolor gold;
      for i=0 upto 3:
        fill t rotated 90i withcolor plum;
        fill a rotated 90i withcolor $;
        fill b rotated 90i withcolor $;
      endfor);
  endfor

  numeric u, v, grouting; grouting = 1/2;  % also try negative...
  (u-grouting, v-grouting) = urcorner tile0 - llcorner tile0;
  for i=1 upto 8:
    for j= 1 upto 5:
      draw tile[(i+j) mod 2] shifted (i*u, j*v);
    endfor
  endfor
  picture P; P = currentpicture; unfill bbox P; draw P;
endfig;
\end{mplibcode}
\end{document}
