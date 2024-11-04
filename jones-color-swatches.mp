\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1); n = 0;
forsuffixes $=ivory, navy, gold, forest, lapiz, plum:
  pair z; z = -12(0, incr n);
  label.lft(image(fill unitsquare xscaled -30 yscaled 8 withcolor $), z + 8 right);
  string t; t = decimal (n+1);
  label.rt("\vbox{\smallmpexternal[firstline=" & t & ",lastline=" & t & "]{jones-colors.mp}}", z);
endfor
endfig;
\end{mplibcode}
\end{document}

