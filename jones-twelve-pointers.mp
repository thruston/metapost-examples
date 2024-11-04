\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
input star
beginfig(1);
    numeric u; u = 21;
    path s, h, t, p, q;
    s = star(12, 4, u);
    t = star(12, 5, 2u) rotated 15;
    h = star(6, 1, 2.886751345948129 u) rotated 30;
    numeric a;
    (a, whatever) = h intersectiontimes subpath(0,-1) of t rotatedabout(point 0 of t, 180);
    path p; p = subpath(0,2) of t -- subpath (6-a, a-6) of h -- cycle;
    path r; r = (subpath(6-a, a-6) of h) reflectedabout(point 2-a/3 of h, point a/3-2 of h) rotated 30 ;
    path q; q = subpath(2,4) of t -- r -- cycle;
     

    picture rosette[]; 
    rosette0 = image(
        fill s withcolor navy;
        for i=0 upto 5:
            fill p rotated 60i withcolor if i mod 3 = 1: lapiz else: navy fi;
            fill q rotated 60i withcolor if i mod 3 = 2: gold else: forest fi;
        endfor
    );
    rosette1 = image(
        fill s withcolor navy;
        for i=0 upto 5:
            fill p rotated 60i withcolor if i mod 3 = 1: lapiz else: navy fi;
            fill q rotated 60i withcolor if i mod 3 = 2: forest else: gold fi;
        endfor
    );

y0 = y2 = x1 = x3 = 0;
x0 = -x2; y1 = -y3 = 5u;
z1 - z2 = z0 - z4 = whatever * dir 60;

picture unit; unit = image(
    for i=0 upto 3:
        draw rosette[i mod 2] shifted z[i];
    endfor);
pair u, v;
u = lrcorner rosette1 - llcorner rosette1;
v = u rotated 60;

for i=0 upto 7:
    for j=0 upto 7:
        draw rosette[j mod 2] shifted (i*u + j*v - floor(j/2)*u);
    endfor
endfor




picture P; P = currentpicture; fill bbox P withcolor ivory; draw P;
endfig;
\end{mplibcode}
\end{document}

