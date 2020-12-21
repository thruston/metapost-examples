vardef arrow_label(expr A,B,S,O) =
    save arrow_path; path arrow_path;
    arrow_path = ((A--B) 
    cutbefore fullcircle scaled 1/2 shifted A
    cutafter  fullcircle scaled 1/2 shifted B)
    shifted (unitvector( (A-B) rotated 90) scaled O);

    drawdblarrow arrow_path;

    save p; picture p;
    p = thelabel(S, point 1/2 of arrow_path);
    unfill bbox p;
    draw p;
enddef;

