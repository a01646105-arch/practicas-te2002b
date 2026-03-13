module cronometer_wrap(
	input MAX10_CLK1_50,
	input [9:0] SW,
	output [6:0] HEX0, HEX1, HEX2, HEX3
);

cronometer WRAP(
	.clk(MAX10_CLK1_50),
	.rst(SW[0]),
	.enable(SW[1]),
	.s_un(HEX3),
	.s_de(HEX2),
	.ms_un(HEX1),
	.ms_de(HEX0)
);

endmodule