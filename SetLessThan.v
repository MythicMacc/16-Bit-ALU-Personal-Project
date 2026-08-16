module SetLessThan(
input [15:0]a,
input [15:0]b,
output [15:0]SLTR
);

wire as = 1'b1;
wire OF, SB;

sixteenBitCLA CLA3(.A(a),.B(b),.AS(as),.overflow(OF),.sign_bit(SB));

xor x1(SLTR[0],OF,SB);


endmodule