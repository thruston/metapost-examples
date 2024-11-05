\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
input jones-generic-star
beginfig(1);
  numeric u, x; u=15; x = 0;
  for i = 5, 6, 7, 8, 9, 10, 11, 12:
    x := x + 1;
    for j = 1 upto floor ((i-1)/2): 
      pair z; z = (x, j) scaled 2.3 u;
      path s; s = star(i, j, u) shifted z;
      fill s withcolor if odd i: gold else: ivory fi; draw s;
      if i/j >= 5/2:
        label("$\scriptstyle " & decimal i & "," & decimal j & "$", z);
      fi
    endfor
  endfor
endfig;
\end{mplibcode}
\end{document}

