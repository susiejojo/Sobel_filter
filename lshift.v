module magcomp_8(a,b,equal,a_great,b_great);
  input [7:0]a,b;
  output equal,a_great,b_great;
  wire ex,gx,sx;
  magcomp_4 m1(a[7:4],b[7:4],{1'b1},{1'b0},{1'b0},ex,gx,sx);
  magcomp_4 m2(a[3:0],b[3:0],ex,gx,sx,equal,a_great,b_great);
endmodule

module magcomp_4(a,b,ex,gx,sx,e,g,s); //sub- module for 4-bit magnitude comparator
  input [3:0]a,b;
  input ex,gx,sx;
  output e,g,s;
  wire [3:0]x,bbar;
  wire g1,g2,g3,g4,g5,ebar,gbar;
    xnor z3(x[3],a[3],b[3]);
  xnor z2(x[2],a[2],b[2]);
  xnor z1(x[1],a[1],b[1]);
  xnor z0(x[0],a[0],b[0]);
   not n3(bbar[3],b[3]);
  not n2(bbar[2],b[2]);
  not n1(bbar[1],b[1]);
  not n0(bbar[0],b[0]);
  and q1(g1,a[3],bbar[3]);
  and q2(g2,x[3],a[2],bbar[2]);
  and q3(g3,x[3],x[2],a[1],bbar[1]);
  and q4(g4,x[3],x[2],x[1],a[0],bbar[0]);
  and q5(g5,x[3],x[2],x[1],x[0],gx); 
  or o1(g,g1,g2,g3,g4,g5);
  and a1(e,x[0],x[1],x[2],x[3],ex); 
  not n4(ebar,e);
  not n5(gbar,g);
  and a2(s,ebar,gbar);
endmodule
