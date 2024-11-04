\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
    numeric u; u = 21;
    path s, t; 
    s = unitsquare scaled u shifted 1/2(3u, -u) rotated 45;
    t = subpath (2,3) of s -- subpath (0,1) of s rotated 90 -- cycle; 

    picture unit; 
    unit = image(
        for i=0 upto 3:
            fill s rotated 90i withcolor navy;
            filldraw t rotated 90i withcolor gold;
        endfor
        drawoptions(withpen pencircle scaled 3/2 withcolor 15/16);
        for i=0 upto 3:
            draw s rotated 90i;
            draw subpath (1,2) of t rotated 90i;
        endfor
        drawoptions();
    );

    pair u, v; 
    u/2 = (xpart point 1 of s, 0);
    v/2 = (0, ypart point 2 of s);

    for i=0 upto 8:
        for j= 0 upto 8:
            draw unit shifted (i*u + j*v);
        endfor
    endfor


    picture P; P = currentpicture; fill bbox P withcolor ivory; draw P;


endfig;
\end{mplibcode}
\end{document}

