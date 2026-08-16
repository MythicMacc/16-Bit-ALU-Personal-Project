module oneToSixteenBit(
	input i,
	output [15:0]o
);

assign o = {16{i}};


endmodule