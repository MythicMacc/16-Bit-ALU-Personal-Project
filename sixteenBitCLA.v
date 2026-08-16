module sixteenBitCLA (
	input [15:0]A,
	input [15:0]B,
	input AS,
	output [15:0]sum,
	output overflow,
	output sign_bit,
	output c1,
	output c2,
	output c3,
	output Cout,
	output zero
);

wire o1,o2,o3,z1;

//4 4-Bit CLA Logic
fourbitCLA FBCLA1(.a(A[3:0]),.b(B[3:0]),.as(AS),.cin(AS),.s(sum[3:0]),.cout(c1));
fourbitCLA FBCLA2(.a(A[7:4]),.b(B[7:4]),.as(AS),.cin(c1),.s(sum[7:4]),.cout(c2));
fourbitCLA FBCLA3(.a(A[11:8]),.b(B[11:8]),.as(AS),.cin(c2),.s(sum[11:8]),.cout(c3));
fourbitCLA FBCLA4(.a(A[15:12]),.b(B[15:12]),.as(AS),.cin(c3),.s(sum[15:12]),.cout(Cout));

//Sum Combination

//Sign Bit
buf(sign_bit,sum[15]);

//Overflow
xor Beff(o1,AS,B[15]);

xnor xn1(o2,A[15],o1);
xor x1(o3,sum[15],A[15]);
and a1(overflow,o3,o2);

//Zero Flag
or or1(z1,sum[0],sum[1],sum[2],sum[3],sum[4],sum[5],sum[6],sum[7],sum[8],sum[9],sum[10],sum[11],sum[12],sum[13],sum[14],sum[15]);
not n1(zero,z1);

endmodule