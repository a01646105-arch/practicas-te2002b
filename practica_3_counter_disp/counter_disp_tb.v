`timescale 1ns / 1ps

module counter_disp_tb();

reg CLK, RST;
reg [7:0] data_in; 
reg load, up_down;
wire [6:0] D_un, D_de, D_ce, D_mi; // Por convención, las señales del display de 7 segmentos empieza con el segmento 0

counter_disp #(
    .CMAX(20), // Cuenta de 20 unidades
    .FREQ(1000000) // Frecuencia alta para vizualizar en ModelSim
) DUT(
    .CLK(CLK),
    .RST(RST),
	 .data_in(data_in),
	 .load(load),
	 .up_down(up_down),
    .D_un(D_un),
    .D_de(D_de),
    .D_ce(D_ce),
    .D_mi(D_mi)
);

initial begin
    CLK <= 0;
    forever #10 CLK <= ~CLK;
end

initial begin
	 data_in <= 0;
    RST <= 1; load <= 0; up_down <= 0; #1000;
    RST <= 0; #10000; // Contador cuenta arriba por 1000 ciclos
	 RST <= 1; #1000; // Se reinicia la senal
	 RST <= 0; up_down <= 1; #10000; // Contador cuenta para abajo por 1000 ciclos
	 RST <= 1; 
	 RST <= 0; load <= 1; data_in <= 58; #1000; // Se carga el valor binario
	 load <= 0; #10000; // La cuenta sigue para abajo desde el valor cargado
	 

	 $stop;
    $finish;
end

initial begin
    $dumpfile("counter_disp.vcd");
    $dumpvars(0, counter_disp_tb);
end

endmodule