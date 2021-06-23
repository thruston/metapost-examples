vardef superlabel(expr t, z) = 
    interim bboxmargin := 6;
    save P; picture P; P = thelabel(t, origin);
    save s; path s; s = superellipse(point 3/2 of bbox P, point 5/2 of bbox P, point 7/2 of bbox P, point 1/2 of bbox P, 0.78); 
    unfill s shifted z; draw P shifted z;
enddef;
