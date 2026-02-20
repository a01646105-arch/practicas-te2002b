module counter_disp_w(
    input [9:0] SW,
    input CLOCK_50,
    output [0:6] HEX0, HEX1, HEX2, HEX3 // Por convención, las señales del display de 7 segmentos empieza con el segmento 0
);

counter_disp WRAP(
    .CLK(CLOCK_50),
    .RST(SW[0]),
	 .data_in(SW[9:3]),
	 .load(SW[2]),
	 .up_down(SW[1]),
    .D_un(HEX0),
    .D_de(HEX1),
    .D_ce(HEX2),
    .D_mi(HEX3)
);

endmodule