newinternal ipca, ipsa, ipcb, ipsb, ipscale;

def set_projection(expr alpha, beta) = 
    ipca := cosd(alpha); ipsa := sind(alpha);
    ipcb := cosd(beta); ipsb := sind(beta);
enddef;

ipscale := 20;

vardef p(expr x, y, z) = 
    (x * ipcb - z * ipsb, y * ipca + x * ipsa * ipsb + z * ipsa * ipcb) scaled ipscale
enddef;
