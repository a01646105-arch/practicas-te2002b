// Maximo es 136 de suma, o 16 de entrada
module sumador(			
	input [3:0] switch_input,
	input start,
	input clk,
	input rst,
	output [6:0] D_un, D_de, D_ce
);

// Variable local con la suma
wire [7:0] sum;

// Obtener la suma de acuerdo al input del switch
contador get_sum(
	.clk(clk),
	.rst(rst),
	.start(start),
	.value(switch_input),
	.sum(sum)
);


// Desplegar la suma
bcd_sum disp_sum(
	.bcd_in(sum),
	.D_un(D_un),
	.D_de(D_de),
	.D_ce(D_ce)
);



endmodule