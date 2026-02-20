module BCD_module(
    input [3:0] BCD_in,
    output reg [0:6] BCD_out // Por convención, las señales del display de 7 segmentos empieza con el segmento 0
);

always @(*)
    begin
        case(BCD_in)
            0: BCD_out = 7'b0000_001; // Las señales del display de 7 segmentos están invertidas
            1: BCD_out = 7'b1001_111;
            2: BCD_out = 7'b0010_010;
            3: BCD_out = 7'b0000_110;
            4: BCD_out = 7'b1001_100;
            5: BCD_out = 7'b0100_100;
            6: BCD_out = 7'b0100_000;
            7: BCD_out = 7'b0001_111;
            8: BCD_out = 7'b0000_000;
            9: BCD_out = 7'b0001_100;
            default: BCD_out = 7'b1111_111;
        endcase
    end

endmodule
