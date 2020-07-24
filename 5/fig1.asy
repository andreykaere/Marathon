import geometry;
size(7cm);

point A = (0,0);
point C = (7,0);
point B = (5,6);

circle w = circle(A,B,C);
point O_ = w.C;

real y = 4.3;
line n = line((y,0),(y,1));

point P = intersectionpoints(n,w)[0];

real x = 4.8;

line l = line((x,0),(x,1));
point E_ = intersectionpoint(l, line(B,P));

point Ep = projection(line(A,C))*E_;

point F = intersectionpoint(line(A,P),line(E_,O_));
point Fp = projection(line(B,C))*F;


point H = intersectionpoint(line(E_,Ep),line(F,Fp));

point Pp = reflect(line(O_,E_))*P;

//draw
dot("$A$", A, SW);
dot("$B$", B, NW);
dot("$C$", C);
dot("$O$", O_);
dot("$P$", P, SE);
dot("$E$", E_, SE);
dot("$E'$", Ep, SE);
dot("$F$", F, SE);
dot("$F'$", Fp, SE);
dot("$H$", H, SE);
dot("$P'$", Pp, SE);
//dot("$D$", D, SW);
//dot("$W$", W_, N+E*.7);

draw(A--B--C--cycle);
draw(w);
draw(B--P--A);
draw(E_--Ep^^F--Fp);

draw(line(O_,E_));

draw(line(C,H),dashed);

markrightangle(F,Fp,C);
markrightangle(C,Ep,E_);
