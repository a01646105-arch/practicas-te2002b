module BCD_module(
    input [3:0] BCD_in,
    output reg [6:0] BCD_out
);

always @(*)
    begin
        case(BCD_in)
            0: BCD_out = 7'b1111_110;
            1: BCD_out = 7'b0110_000;
            2: BCD_out = 7'b1101_101;
            3: BCD_out = 7'b1111_001;
            4: BCD_out = 7'b0110_011;
            5: BCD_out = 7'b1011_011;
            6: BCD_out = 7'b1011_111;
            7: BCD_out = 7'b1110_000;
            8: BCD_out = 7'b1111_111;
            9: BCD_out = 7'b1110_011;
            default: BCD_out = 7'b0000_000;
        endcase
    end

endmodule