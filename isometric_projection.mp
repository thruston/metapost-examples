newinternal ipca, ipsa, ipcb, ipsb, ipscale;

def set_projection(expr alpha, beta) =
    ipca := cosd(alpha); ipsa := sind(alpha);
    ipcb := cosd(beta); ipsb := sind(beta);
enddef;

ipscale := 20;

vardef p(expr x, y, z) =
    (x * ipcb - z * ipsb, y * ipca + x * ipsa * ipsb + z * ipsa * ipcb) scaled ipscale
enddef;

vardef cuboid(expr x, y, z, a, b, c) = image( 
    fill p(0, 0, 0) -- p(0, 0, z) -- p(0, y, z) -- p(0, y, 0) -- cycle withcolor a;
    fill p(x, y, 0) -- p(x, y, z) -- p(0, y, z) -- p(0, y, 0) -- cycle withcolor b;
    fill p(0, 0, 0) -- p(x, 0, 0) -- p(x, y, 0) -- p(0, y, 0) -- cycle withcolor c;
    draw p(x, y, 0) -- p(x, 0, 0) -- p(0, 0, 0) -- p(0, y, 0) --
         p(x, y, 0) -- p(x, y, z) -- p(0, y, z) -- p(0, 0, z) --
         p(0, 0, 0) -- p(0, y, 0) -- p(0, y, z);
) enddef;

vardef cube(expr a, b, c) = cuboid(-1, 1, 1, a, b, c) enddef;
vardef semicube(expr a, b, c) = cuboid(-1, 1/2, 1, a, b, c) enddef;
