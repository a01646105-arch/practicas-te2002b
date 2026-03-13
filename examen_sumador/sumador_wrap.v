module sumador_wrap(
	input MAX10_CLK1_50,
	input [9:0] SW,
	output [6:0] HEX0, HEX1, HEX2
);

sumador WRAP(
	.switch_input(SW[5:2]),
	.start(SW[1]),
	.clk(MAX10_CLK1_50),
	.rst(SW[0]),
	.D_un(HEX0),
	.D_de(HEX1),
	.D_ce(HEX2),
);

endmodule