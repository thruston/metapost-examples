\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
    color ivory, navy, gold, forest;
    ivory = 1/256 (208, 199, 186);
    navy = 1/256 (45, 48, 66);
    gold = 1/256 (203, 135, 71);
    forest = 1/256 (59, 89, 82);

    path tack;
    tack = (0,0) -- (0,2) -- (1,2) -- (1,3) -- (-1,3);
    tack := tack rotated (90 - angle (-1,3));
    tack := tack -- subpath (3,1) of tack reflectedabout(up, down) -- cycle;
    tack := tack scaled 21;

    pair u, v; v = point 4 of tack - point 0 of tack;
    u = v rotated -90;

    n = 8;
    path box; box = makepath pensquare scaled (4n * abs(v));

    fill box withcolor ivory;

    for i=-n upto n:
        for j=-n upto n:
            for t=-90, 90:
                path a, b;
                a = tack rotated t shifted (j*2v) shifted (i*2u);
                b = a shifted v shifted u;
                fill a withcolor if odd i: forest else: gold fi;
                fill b withcolor if t if odd i: < else: > fi 0: navy else: gold fi;
                drawoptions(withpen pencircle scaled 1 withcolor 15/16);
                draw a; draw b;
                drawoptions();
            endfor
        endfor
    endfor

    clip currentpicture to box;

endfig;
\end{mplibcode}
\end{document}

