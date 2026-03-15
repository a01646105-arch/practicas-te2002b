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
    $display("Simulacion iniciada.");
    #30;
    rst <= 1;     // Activar reset para forzar condiciones iniciales
    #10;
    rst <= 0;     // Desactivar reset
    #110;       // Demora para estabilizar sistema (5 1/2 ciclos de reloj)
    
    sw_in <= $random % 17;   // Asignamos valor entre 0 y 16 (ambos incluidos)
    start <= 1;             // Señal debe permanecer encendida
    #320;                 // Demora para verificar resultados de suma (16 ciclos)
    $display("Simulacion terminada.");

    $stop;
    $finish;
end

initial begin
    $dumpfile("sumador_tb.vcd");
    $dumpvars(0, sumador_tb);
end

endmodule