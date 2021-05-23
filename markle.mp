vardef angle_mark(expr a, o, b, r, t, shade) =
    draw fullcircle scaled 2r rotated angle (a-o) shifted o cutafter (o--b)
         withpen pencircle scaled 1/4;
    save p; picture p;
    p = thelabel(t, origin);
    save offset, alpha; numeric offset, alpha;
    alpha = 1/2 (angle (a-o) + angle (b-o));
    offset = r + arclength ((origin -- 100 dir alpha
    shifted center bbox p) cutafter bbox p);
    draw p shifted o shifted (offset * dir alpha) withcolor shade;
enddef;
