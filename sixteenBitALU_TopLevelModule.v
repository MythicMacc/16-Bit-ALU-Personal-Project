module sixteenBitALU_TopLevelModule (
	input [15:0]AI,BI,
	input [3:0]SEL,
	output COUT,SIGN_BIT,OVERFLOW,ZERO,
	output [15:0]Result
);

wire [15:0]l1,l2,l3,l4,l5,l6;
wire [15:0]sumw;
wire nw1,nw2,nw3,asw;
wire [15:0]s1,s2,s3;
wire [15:0]i1,d1;
wire [15:0]p1,p2;
wire [15:0]slt1;

//Operation Module Connection
LogicModule L1(AI,BI,l1,l2,l3,l4,l5,l6);

not n1(nw1,SEL[1]);
not n2(nw2,SEL[2]);
not n3(nw3,SEL[3]);
and a1(asw,SEL[0],nw1,nw2,nw3);

sixteenBitCLA CLA1(.A(AI),.B(BI),.AS(asw),.sum(sumw),.overflow(OVERFLOW),.sign_bit(SIGN_BIT),.zero(ZERO),.Cout(COUT));

SLL S1(AI,s1);
SRL S2(AI,s2);
SRA S3(AI,s3);

IncrementA IA(AI,i1);
DecrementA DA(AI,d1);

PassA P1(AI,p1);
PassB P2(BI,p2);

SetLessThan SLT1(AI,BI,slt1);

//Output Mux Connection
OutputMUX OM1(SEL,sumw,sumw,l1,l2,l3,l4,l5,l6,s1,s2,s3,i1,d1,p1,p2,slt1,Result);


endmodule