module fourbitCLA (
	input [3:0]a, 
	input	[3:0]b,
	input	cin, 
	input	as, 
	output [3:0]s, 
	output cout
);

wire beff1,beff2,beff3,beff4,g1,g2,g3,g4,p1,p2,p3,p4,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13;

//Subtractor Block
xor x1(beff1,b[0],as); 
xor x2(beff2,b[1],as);
xor x3(beff3,b[2],as);
xor x4(beff4,b[3],as);

//Generate Signals
and a1(g1,a[0],beff1);
and a2(g2,a[1],beff2);
and a3(g3,a[2],beff3);
and a4(g4,a[3],beff4);

//Propagate Signals
xor x5(p1,a[0],beff1);
xor x6(p2,a[1],beff2);
xor x7(p3,a[2],beff3);
xor x8(p4,a[3],beff4);

//CLA Logic
and a5(c1,p1,cin);
and a6(c2,p1,p2,cin);
and a7(c3,p2,g1);

or o1(c4,g1,c1);
or o2(c5,g2,c2,c3);

and a8(c6,p1,p2,p3,cin);
and a9(c7,p2,p3,g1);
and a10(c8,g2,p3);

or o3(c9,g3,c6,c7,c8);

and a11(c10,p1,p2,p3,p4,cin);
and a12(c11,g1,p2,p3,p4);
and a13(c12,g2,p3,p4);
and a14(c13,p4,g3);

or o4(cout,c10,c11,c12,c13,g4);

//Sum Position
xor x9(s[0],p1,cin);
xor x10(s[1],c4,p2);
xor x11(s[2],c5,p3);
xor x12(s[3],c9,p4);



endmodule