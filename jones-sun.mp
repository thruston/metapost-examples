\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
    path S[], a, b;
    a = makepath pensquare scaled 42 rotated 22.5;
    b = a rotated 45;
    numeric t, u;
    (t, u) = a intersectiontimes b;
    S0 = for i=0 upto 3:
        point i of a -- point i+u of a -- point i of b -- point i+t of a -- 
    endfor cycle;

    z0 = whatever[point 2 of S0, point 6 of S0] = whatever[point 12 of S0, point 16 of S0];
    z1 = whatever[point 2 of S0, point 14 of S0] = whatever[point 12 of S0, point 8 of S0];

    S1 = S0 rotatedabout(z0, 180);
    S2 = S0 rotatedabout(z1, 180);

    z2 = whatever[point 4 of S0, point 16 of S0] = whatever[point 10 of S0, point 14 of S0];
    z3 = whatever[point 12 of S2, point 16 of S2] = whatever[point 10 of S2, point 6 of S2];
    z4 = whatever[point 4 of S0, point 16 of S0] = whatever[point 10 of S2, point 6 of S2];
    path wedge; wedge = z1 -- point 12 of S2 -- z3 -- z4 -- z2 -- point 14 of S0 -- cycle;
    
    vardef unit(expr shade) = image(
        fill S0 withcolor gold;
        for i=0 upto 3:
            fill wedge rotatedabout(1/2[center S1, center S2], 90i) withcolor shade;
        endfor
        draw S0 withcolor white;
        for i=0 upto 3:
            draw wedge rotatedabout(1/2[center S1, center S2], 90i) withcolor white;
        endfor
    ) enddef;

    pair u, v;
    u = center S0 - center S1;
    v = u rotated 90;

    numeric n; n = 4;
    for i = -n upto n:
        for j = -n upto n:
            draw unit(if odd (i+j): navy else: forest fi) shifted (i*u + j*v);
        endfor
    endfor

    picture p; p = currentpicture; fill bbox p withcolor ivory; draw p;
endfig;
\end{mplibcode}
\end{document}

