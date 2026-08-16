module OperationSelectDecoder(
	input [3:0]s,
	output add,
	output sub,
	output ando,
	output oro,
	output xoro,
	output not_ao,
	output nando,
	output noro,
	output sll,
	output srl,
	output sra,
	output ia,
	output da,
	output pa,
	output pb,
	output slt
);

wire s0n,s1n,s2n,s3n;

not n1(s0n,s[0]);
not n2(s1n,s[1]);
not n3(s2n,s[2]);
not n4(s3n,s[3]);

and a1(add,s0n,s1n,s2n,s3n);
and a2(sub,s[0],s1n,s2n,s3n);

and a3(ando,s0n,s[1],s2n,s3n);
and a4(oro,s[0],s[1],s2n,s3n);
and a5(xoro,s[2],s0n,s1n,s3n);
and a6(not_ao,s[0],s1n,s[2],s3n);
and a7(nando,s0n,s[1],s[2],s3n);
and a8(noro,s[0],s[1],s[2],s3n);

and a9(sll,s0n,s1n,s2n,s[3]);
and a10(srl,s[0],s1n,s2n,s[3]);
and a11(sra,s0n,s[1],s2n,s[3]);

and a12(ia,s[0],s[1],s2n,s[3]);
and a13(da,s0n,s1n,s[2],s[3]);

and a14(pa,s[0],s1n,s[2],s[3]);
and a15(pb,s0n,s[1],s[2],s[3]);

and a16(slt,s[0],s[1],s[2],s[3]);


endmodule