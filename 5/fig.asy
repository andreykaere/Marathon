import geometry;

size(12cm);

point A = (0,0);
point B = (6.9,8.7);
point C = (11.5,0);

circle w = circle(A,B,C);
point O_ = w.C;

point G = (2,5);

point P = intersectionpoints(w,line(O_,G))[1];

//point Y = (-4.5,7.5);
point Y = (-2.5,6.5);

line l = line(O_,Y);

real x = -2.5;
point Q = intersectionpoint(line((x,0), (x,1)),l);

circle Wa = circle(P,Q,A);
circle Wb = circle(P,Q,B);
circle Wc = circle(P,Q,C);


point A0 = intersectionpoints(Wa,l)[0];
point B0 = intersectionpoints(Wb,l)[1];
point C0 = intersectionpoints(Wc,l)[0];

point A1 = projection(line(B,C))*A0;
point B1 = projection(line(A,C))*B0;
point C1 = projection(line(A,B))*C0;

point T = intersectionpoints(line(C,C0),w)[1];

line c = line(C0,C1);
line b = line(B0,B1);
line a = line(A0,A1);
point Ap = intersectionpoint(b,c);
point Bp = intersectionpoint(a,c);
point Cp = intersectionpoint(b,a);

circle wp = circle(Ap,Bp,Cp);

point S_ = intersectionpoints(w,wp)[0];



//draw
draw(wp, linetype(new real[] {7,7})+linewidth(.85));
draw(line(A,A0), linewidth(.3));
dot(Label("$A$", UnFill), A, S*1.3+W*.9);

draw(l);
dot(Label("$A_0$", UnFill), A0, W*1.3+N);
clipdraw(Wc, linewidth(.3));
dot(Label("$C_1$", UnFill), C1, S*1.3+E*.2);
draw(line(C,C0), linewidth(.3));
dot("$A'$", Ap, NW);
dot(Label("$B'$", UnFill), Bp, N*1.3+E*.5);
dot("$C'$", Cp, S+W*1.2);
draw(line(A1,C1), dashed);

dot("$B$", B, N*1.3+E*.0);
dot("$C$", C, N+E*1.2);
dot("$B_0$", B0, E*.7+N*.7);
dot("$C_0$", C0, W*.3+S);
dot("$A_1$", A1, S*.6+E*1.2);
dot("$B_1$", B1, SE);

dot("$O$", O_, S*.5+W*.5);
dot("$P$", P, N+E*.1);
dot("$Q$", Q, N*.8);

dot("$S$", S_, N*.8+W*1);
dot("$T$", T, N*1.5+W*.1);
//dot("$G$", G);

//draw(A--B--C--cycle);
draw(w);
draw(Wa, linewidth(.3));
clipdraw(Wb, linewidth(.3));
draw(line(A,C));
draw(A--B--C);



draw(A0--A1, linetype(new real[] {7,7}) + linewidth(.8));
draw(B0--B1, linetype(new real[] {7,7}) + linewidth(.8));
draw(C0--C1, linetype(new real[] {7,7}) + linewidth(.8));


draw(C1--Bp, linewidth(.8));

markrightangle(A0,A1,C, 7, linewidth(.8));
markrightangle(C0,C1,B, 7, linewidth(.8));
markrightangle(B0,B1,A, 7, linewidth(.8));


draw(line(B,B0), linewidth(.3));

//draw(, linewidth(.3));

draw(Ap--Cp--Bp--cycle, linewidth(1));
draw(A--C--B--cycle, linewidth(1));

draw(B--P--Q^^A--P--C);
markangle(T,B,P,radius=5mm, linewidth(.7));
markangle(O_,Q,P,radius=5mm, linewidth(.7));
markangle(T,C,P,radius=5mm, linewidth(.7));
markangle(A0,A,P,radius=5mm, linewidth(.7));


draw(box((-11.5,-5), (0,0)), invisible);
