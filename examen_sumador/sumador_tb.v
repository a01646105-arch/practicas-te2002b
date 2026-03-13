`timescale 1ns/1ps

module sumador_tb();

reg [3:0] sw_in;
reg start, clk, rst;
wire [6:0] D_un, D_de, D_ce;

sumador DUT(
    .switch_input(sw_in),
    .start(start),
    .clk(clk),
    .rst(rst),
    .D_un(D_un),
    .D_de(D_de),
    .D_ce(D_ce)
);

// Condiciones iniciales
initial begin
    sw_in <= 0;
    start <= 0;
    clk <= 0;
    rst <= 0;
end

// Generar señal de reloj (50 MHz)
always #10 clk <= ~clk;

initial begin
    $display("Simulacion iniciada.")
    
end


endmodule