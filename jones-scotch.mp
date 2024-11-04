\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
input jones-colors
beginfig(1);
    path s, t; 
    t = ((-3,-3) -- (-3, -3.585786) -- (-2.585786, -4) -- (2.585786, -4) -- (3, -3.585786) -- (3,-3) -- cycle)
        scaled 10.5;
    s = ((0, -0.585786) -- (0.41421, -1) -- (1,-1) -- (1, -3) -- (0, -4) 
        -- (-1, -3) -- (-1, -1) -- (-0.41421, -1) -- cycle) scaled 10.5;

    vardef unit(expr shade) = image(
        for i=0 upto 3:
            filldraw t rotated 90i withcolor navy;
        endfor
        for i=0 upto 3:
            fill s rotated 90i withcolor shade;
            draw s rotated 90i withpen pencircle scaled 1 withcolor 15/16;
        endfor
    ) enddef;

    pair u, v;
    u = (84, 0); v = u rotated 90;


    for i=0 upto 8:
        for j= 0 upto 8:
            color sh; sh = 
            if odd floor(i/2):
                if odd floor(j/2): lapiz else: forest fi
            else:
                if odd floor(j/2): forest else: gold fi
            fi;
            draw unit(sh) shifted (i*u + j*v);
        endfor
    endfor


    picture P; P = currentpicture; fill bbox P withcolor ivory; draw P;


endfig;
\end{mplibcode}
\end{document}

