\documentclass{scrartcl}
\usepackage{unicode-math}
\setmainfont{TeX Gyre Pagella}
\setmathfont{TeX Gyre Pagella Math}
\setsansfont{TeX Gyre Heros}
\usepackage{mflogo}
\usepackage{xcolor}
\usepackage{luamplib}
\mplibtextextlabel{enable}
\everymplib{input colorbrewer-rgb;interim ahangle := 30;beginfig(0);}\everyendmplib{endfig;}
\usepackage{shortvrb}\MakeShortVerb{"} % " 
\title{Some examples for Metapost}
\date{March 2021}
\author{Toby Thurston}
\mplibtextextlabel{enable}
\begin{document}
\maketitle

\noindent
This short document sets outs some intermediate examples of technical drawing with \MP.
Some of the diagrams are adapted from the excellent TikZ manuals, to facilitate comparison.
You will find some commentary in the text here, but there is more in the source file.
The focus is on what you can do with the "plain" \MP\ format; the reason for this is that 
it is (relatively) simple and has a nice consistent syntax.  The usual style presented here
is to define points and paths; then draw them; then add text and labels.  

\definecolor{sin}{rgb}{0.8671875, 0.17578125, 0.1484375}
\definecolor{cos}{rgb}{0.19140625, 0.5078125, 0.73828125}
\definecolor{alpha}{rgb}{0.19140625, 0.63671875, 0.328125}
\definecolor{tan}{rgb}{0.8984375, 0.33203125, 0.05078125}
\newcommand{\sa}{{\color{sin}{\sin\alpha}}}
\newcommand{\ca}{{\color{cos}{\cos\alpha}}}
\newcommand{\ta}{{\color{tan}{\tan\alpha}}}

$$
\begin{mplibcode}
numeric u; u = 72;
path xx, yy;
xx = (left--right) scaled 3/2u;
yy = xx rotated 90;

z1 = u * dir 30;
z2 = whatever * z1; x2 = u;

path angle_mark;
angle_mark = origin -- fullcircle scaled 3/4u cutafter (origin -- z1) -- cycle;

% grid
for i=-1, -1/2, 1/2, 1:
    draw xx scaled .9 shifted (0, i*u) withpen pencircle scaled 1/4 withcolor 1/2;
    draw yy scaled .9 shifted (i*u, 0) withpen pencircle scaled 1/4 withcolor 1/2;
endfor

fill angle_mark withcolor Greens 7 2; draw angle_mark withcolor Greens 7 5;

draw fullcircle scaled 2u;
drawarrow xx;
drawarrow yy;

draw origin -- z2;
draw origin -- (x1, 0) withpen pencircle scaled 3/4 withcolor Blues 6 5;
draw z1 -- (x1, 0) withpen pencircle scaled 3/4 withcolor Reds 6 5;
draw z2 -- (x2, 0) withpen pencircle scaled 3/4 withcolor Oranges 6 5;

label.rt("$x$", point 1 of xx);
label.top("$y$", point 1 of yy);

label.bot("$\ca$", 1/2 (x1, 0));
label.lft("$\sa$", (x1, 7/16 y1));
label.rt("$\ta={\sa\over\ca}$", (x2, 1/2 y2));
label("$\color{alpha}\alpha$", 2/3 point arctime 1/2 arclength angle_mark of angle_mark of angle_mark);

picture po, ph, mh, mo;
po = thelabel("$1$", origin);
ph = thelabel("$\scriptstyle\frac12$", origin);
mo = thelabel("$-1$", origin);
mh = thelabel("$\scriptstyle -\frac12$", origin);

def draw_blank(expr p) = unfill bbox p; draw p enddef;
draw_blank(po shifted (-8, u));
draw_blank(ph shifted (-8, 1/2u));
draw_blank(mo shifted (-12, -u));
draw_blank(mh shifted (-12, -1/2u));
draw_blank(po shifted (u, -9));
draw_blank(mo shifted (-u, -9));
draw_blank(mh shifted (-1/2u, -9));

picture cartouche; 
cartouche = thelabel.rt(btex \vbox{\hsize 160pt \small\raggedright\noindent
The \textcolor{alpha}{angle $\alpha$} is $30^\circ$ in the example
($\pi/6$ in radians).  The \textcolor{sin}{sine of $\alpha$}, which
is the height of the red line, is
$${\sa}=1/2.$$%
By the Theorem of Pythagoras we have
${\color{cos}\cos^2\alpha} + {\color{sin}\sin^2\alpha} = 1$. Thus the
length of the blue line, which is the \textcolor{cos}{cosine of $\alpha$}, must be
$${\ca} = \sqrt{1-1/4} = \sqrt3/2.$$%
This shows that $\ta$, which is the height of the orange line, is 
$$\ta={\sa\over\ca}=1/\sqrt3.$$} etex, point 3/2 of bbox currentpicture shifted 5.2 right);

vardef rounded_bbox expr p = 
    path b, c; 
    b = bbox p; 
    c = reverse quartercircle scaled 2 reflectedabout (up, right) scaled 4;
    for t=0 upto 3: c rotated 90t shifted point t of b -- endfor cycle
enddef;

interim bboxmargin := 6;
fill rounded_bbox cartouche withcolor Reds 8 1; 
draw cartouche;
\end{mplibcode}
$$
\end{document}

