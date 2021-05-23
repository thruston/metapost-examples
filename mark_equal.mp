vardef mark_equal(expr a,b,n) =
    save peck, line; path peck, line;
    peck = (down--up) scaled 3/2 rotated -8;
    line = a--b;
    for i=0 upto n-1:
        draw peck rotated angle direction 1/2 of line
            shifted point 1/2 of line
            shifted (unitvector(direction 1/2 of line) scaled (i-(n-1)/2));
    endfor
enddef;
