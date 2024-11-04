\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
path cross;
vardef star(expr n, s, r) =
    save a, b, t; path a, b; numeric t;
    a = (up -- up rotated (360/n*s)) scaled r;
    b = a rotated -(360/n*(s-1));
    (t,whatever) = a intersectiontimes b;
    for i=0 upto 2n-1: subpath (0, t) of a rotated (360/n*i) -- endfor cycle
enddef;
cross = star(8,2,21);

pair u, v;
v = point 0 of cross - point 8 of cross;
u = point 4 of cross - point 12 of cross;
n = 4;
for i=-n upto n:
    for j=-n upto n:
        fill cross shifted (i*u+j*v) withcolor 
            if odd (floor((i+abs(j))/(2abs(j)+1)) + j): forest else: navy fi;
        draw cross shifted (i*u+j*v) withpen pencircle scaled 1 withcolor 1/2[ivory, white];
    endfor
endfor
picture P; P = currentpicture; fill bbox P withcolor ivory; draw P;
endfig;
\end{mplibcode}
\end{document}

