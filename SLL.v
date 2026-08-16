module SLL(
	input [15:0]a,
	output [15:0]SLLR
);

assign SLLR = a << 1;

endmodule