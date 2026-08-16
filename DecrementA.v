module DecrementA(
	input [15:0]a,
	output [15:0]DR
	);
	
wire [15:0] b = 16'h0001;
wire 			as = 1'b1;

sixteenBitCLA CLA2(a,b,as,DR);	
	
	
endmodule