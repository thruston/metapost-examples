vardef star(expr n, s, r) =
  save a, b, t; path a, b; numeric t;
  a = (up -- up rotated (360/n*s)) scaled r;
  b = a rotated -(360/n*(s-1));
  (t,whatever) = a intersectiontimes b;
  for i=0 upto 2n-1: subpath (0, t) of a rotated (360/n*i) -- endfor cycle
enddef;
