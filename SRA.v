module SRA(
	input [15:0]a,
	output [15:0]SRAR
);

assign SRAR = $signed(a) >>> 1;

endmodule