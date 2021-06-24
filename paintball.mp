vardef paint_ball(expr C, c, a, b, n) =
    save p; picture p; p = image(
    for i=0 upto n:
        fill interpath(i/n, C, c) withcolor (i/n)[a, b];
    endfor
    draw C;
    ); p
enddef;
picture bball, rball, gball, cball;
bball = paint_ball(fullcircle scaled 16, fullcircle scaled 2 shifted (3,3), 1/4 blue, white, 21);
rball = paint_ball(fullcircle scaled 16, fullcircle scaled 2 shifted (3,3), 3/4 red, white, 21);
gball = paint_ball(fullcircle scaled 16, fullcircle scaled 2 shifted (3,3), 1/2 green, white, 32);
cball = paint_ball(fullcircle scaled 16, fullcircle scaled 1/2 shifted (3,3), 1/16, 3/4, 32);
