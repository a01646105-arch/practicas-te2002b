module password_w(
	input CLOCK_50,
	input [3:0] KEY,
	input [9:0] SW,
	output [6:0] HEX0, HEX1, HEX2, HEX3,
	output [9:0] LEDR
);

password WRAP( 
	.CLK(CLOCK_50),
	.RST(~KEY[0]),
	.check(~KEY[1]),
	.num(SW[9:0]),
	.digit1(HEX0),
	.digit2(HEX1),
	.digit3(HEX2),
	.digit4(HEX3),
	.LED(LEDR)
);

endmodule