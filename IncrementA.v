module IncrementA(
	input [15:0]a,
	output [15:0]IR
	);
	
wire [15:0] b = 16'h0001;
wire 			as = 1'b0;

sixteenBitCLA CLA1(a,b,as,IR);	
	
	
endmodule