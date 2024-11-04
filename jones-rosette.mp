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
    path o; o = for i=0 upto 7: 48 dir (45i + 45/2) -- endfor cycle;
    fill o withcolor navy;
    numeric r, s;
    r = 3; s = 13;
    path t, u; 
    t = (up -- origin -- right) scaled s;
    u = (down * s -- up * r -- right * r -- left * s);
    path leaf; 
    leaf = t shifted 0.707107(s,s) -- 
           u shifted (point 1/2 of o - 1/2(r,r)) -- cycle;
    pickup pencircle scaled 1/4;
    for i=0 upto 7:
        filldraw leaf rotated 45i withcolor ivory;
    endfor
    pickup pencircle scaled 1/2;
    path v;
    v = star(8,2,s);
    fill v withcolor gold;
    draw v withpen pencircle scaled 1/2 withcolor ivory;
    path w, p;
    w = (origin -- subpath(4,8) of v -- cycle)
            shifted (xpart point 0 of o, ypart point 1 of o)
            shifted 0.707107 (s,s);
    p = point 0 of o -- point 5 of w shifted ((-s,-s) scaled 0.707107) --
        point 5 of w -- point 0 of o shifted ((s,-s) scaled 0.707107) -- cycle;
    for i=0 upto 3:
        filldraw w rotated 90i withcolor navy;
        filldraw p rotated 90i withcolor plum;
        filldraw p reflectedabout(left, right) rotated 90i withcolor plum;
    endfor
    picture unit;
    unit = currentpicture;
    currentpicture := nullpicture;
    numeric n; pair u, v;
    u = lrcorner unit - llcorner unit;
    v = ulcorner unit - llcorner unit;
    n = 2;
    for i=-n upto n:
        for j = -n upto n:
            draw unit shifted (i*u + j*v);
        endfor
    endfor

picture P; P = currentpicture; fill bbox P withcolor ivory; draw P;
endfig;
\end{mplibcode}
\end{document}

