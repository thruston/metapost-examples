newinternal ipca, ipsa, ipcb, ipsb, ipscale;

def set_projection(expr alpha, beta) =
    ipca := cosd(alpha); ipsa := sind(alpha);
    ipcb := cosd(beta); ipsb := sind(beta);
enddef;

ipscale := 20;

vardef p(expr x, y, z) =
    (x * ipcb - z * ipsb, y * ipca + x * ipsa * ipsb + z * ipsa * ipcb) scaled ipscale
enddef;

vardef cube(expr a, b, c) = image(
    fill p(0, 0, 0) -- p(0, 0, 1) -- p(0, 1, 1) -- p(0, 1, 0) -- cycle withcolor a;
    fill p(-1, 1, 0) -- p(-1, 1, 1) -- p(0, 1, 1) -- p(0, 1, 0) -- cycle withcolor b;
    fill p(0, 0, 0) -- p(-1, 0, 0) -- p(-1, 1, 0) -- p(0, 1, 0) -- cycle withcolor c;
    draw p(-1, 1, 0) -- p(-1, 0, 0) -- p(0, 0, 0) -- p(0, 1, 0) --
         p(-1, 1, 0) -- p(-1, 1, 1) -- p(0, 1, 1) -- p(0, 0, 1) --
         p(0, 0, 0) -- p(0, 1, 0) -- p(0, 1, 1);
) enddef;

vardef semicube(expr a, b, c) = image(
    fill p( 0, 0, 0) -- p(0, 0, 1) -- p(0, 1/2, 1) -- p(0, 1/2, 0) -- cycle withcolor a;
    fill p(-1, 1/2, 0) -- p(-1, 1/2, 1) -- p(0, 1/2, 1) -- p(0, 1/2, 0) -- cycle withcolor b;
    fill p( 0, 0, 0) -- p(-1, 0, 0) -- p(-1, 1/2, 0) -- p(0, 1/2, 0) -- cycle withcolor c;
    draw p(-1, 1/2, 0) -- p(-1, 0, 0) -- p(0, 0, 0) -- p(0, 1/2, 0) --
         p(-1, 1/2, 0) -- p(-1, 1/2, 1) -- p(0, 1/2, 1) -- p(0, 0, 1) --
         p( 0, 0, 0) -- p(0, 1/2, 0) -- p(0, 1/2, 1);
) enddef;
