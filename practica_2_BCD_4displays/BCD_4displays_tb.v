`timescale 1ns / 1ps

module BCD_4displays_tb #(parameter N_in = 10, N_out = 7)();

reg [N_in-1:0] bcd_in;
wire [N_out-1:0] D_un, D_de, D_ce, D_mi;

BCD_4displays DUT(
    .bcd_in(bcd_in),
    .D_un(D_un),
    .D_de(D_de),
    .D_ce(D_ce),
    .D_mi(D_mi)
);

initial
    begin
        $display("Simulación iniciada.");
        repeat(5) 
        begin
            bcd_in = $random % 1024;
            #10;
        end
        $display("Simulación terminada.");

        $stop;
        $finish;
    end

initial
    begin
        $monitor("Num = %d, BCD_unidad = %b, BCD_decena = %b, BCD_centena = %b, BCD_millar = %b", bcd_in, D_un, D_de, D_ce, D_mi);
    end

// Visualización de ondas de la simulacion con oss-cad-suite
initial
    begin
        $dumpfile("BCD_4displays.vcd");
        $dumpvars(0, BCD_4displays_tb);
    end

endmodule
