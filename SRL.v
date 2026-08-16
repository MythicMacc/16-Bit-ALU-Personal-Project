module SRL(
	input [15:0]a,
	output [15:0]SRLR
);

assign SRLR = a >> 1;

endmodule