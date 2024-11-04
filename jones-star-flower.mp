\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
vardef star(expr n, s, r) =
    save a, b, t; path a, b; numeric t;
    a = (up -- up rotated (360/n*s)) scaled r;
    b = a rotated -(360/n*(s-1));
    (t,whatever) = a intersectiontimes b;
    for i=0 upto 2n-1: subpath (0, t) of a rotated (360/n*i) -- endfor cycle
enddef;
beginfig(1);
    path s, t, a, b; 
    s = star(8, 2, 13) rotated -45/2;
    z0 = whatever[point  4 of s, point  0 of s] 
       = whatever[point 14 of s, point 10 of s]; 
    t = (origin -- subpath (-3, 1) of s -- cycle) rotatedabout(z0, 180);
    z1 = whatever[point 2 of s, point 6 of s]
       = whatever[point 8 of s rotatedabout(z0, 180), point 12 of s rotatedabout(z0, 180)];

    a = point 0 of s -- z0 -- point 2 of t -- z0 rotatedabout(point 0 of t, -45)
        -- z1 -- z0 rotated 45 -- cycle;
    b = a reflectedabout(up, down);

    vardef unit(expr shade) = image(
        fill s withcolor gold;
        for i=0 upto 3:
            fill t rotated 90i withcolor plum;
            fill a rotated 90i withcolor shade;
            fill b rotated 90i withcolor shade;
        endfor
    ) enddef;

    picture p; p = image(draw unit(black));
    pair u, v;
    u = lrcorner p - llcorner p;
    v = u rotated 90;


    for i=0 upto 8:
        for j= 0 upto 8:
            draw unit(if odd (i+j): forest else: navy fi) shifted (i*u + j*v);
        endfor
    endfor


    picture P; P = currentpicture; fill bbox P withcolor ivory; draw P;


endfig;
\end{mplibcode}
\end{document}

