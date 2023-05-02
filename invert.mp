vardef invert(expr p, o, r) = 
    save t; pair t; t = p - o; 
    save s; numeric s; s = r / abs t;
    o + t * s * s
enddef;
vardef invert_path(expr P, o, r, s) = 
    save n; numeric n; n = length P;
    for t=0 step s until n - eps: invert(point t of P, o, r) -- endfor     
          if cycle P: cycle else: invert(point n of P, o, r) fi
enddef;
