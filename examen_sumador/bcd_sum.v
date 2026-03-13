module bcd_sum(
    input [7:0] bcd_in, // Suma como entrada
    output [6:0] D_un, D_de, D_ce // Por convención, las señales del display de 7 segmentos empieza con el segmento 0
);

wire [3:0] unidades, decenas, centenas;

assign unidades = bcd_in % 10;
assign decenas = (bcd_in / 10) % 10;
assign centenas = (bcd_in / 100) % 10;

bcd_module bcd_unidades(.bcd_in(unidades), .bcd_out(D_un));

bcd_module bcd_decenas(.bcd_in(decenas), .bcd_out(D_de));

bcd_module bcd_centenas(.bcd_in(centenas), .bcd_out(D_ce));

endmodule