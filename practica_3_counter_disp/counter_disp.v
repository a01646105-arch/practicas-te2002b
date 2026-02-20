module counter_disp #(parameter CMAX = 100, FREQ = 1)(
    input CLK, RST,
	 input [7:0] data_in, 
	 input load,
	 input up_down,
    output [0:6] D_un, D_de, D_ce, D_mi // Por convención, las señales del display de 7 segmentos empieza con el segmento 0   
);

wire clk_div; // Has to be a wire since it is driven by the clk_div
wire [6:0] count;

clk_divider #(.FREQ(FREQ)) CLK_div(
    .CLK(CLK),
    .RST(RST),
    .clk_div(clk_div)
);

counter #(.CMAX(CMAX)) Counter(
	.CLK(clk_div),
	.RST(RST),
	.data_in(data_in),
	.load(load),
	.up_down(up_down),
	.count(count)
);     

BCD_4displays #(.N_in(7), .N_out(7)) count_display(
    .bcd_in(count),
    .D_un(D_un),
    .D_de(D_de),
    .D_ce(D_ce),
    .D_mi(D_mi)
);

endmodule