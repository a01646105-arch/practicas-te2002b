module bcd_module(
    input [3:0] bcd_in,
    output reg [6:0] bcd_out
);

always @(*)
    begin
        case(bcd_in) //     gfed_cba
            0: bcd_out = 7'b1000_000; // Las señales del display de 7 segmentos están invertidas
            1: bcd_out = 7'b1111_001;
            2: bcd_out = 7'b0100_100; 
            3: bcd_out = 7'b0110_000; 
            4: bcd_out = 7'b0011_001;
            5: bcd_out = 7'b0010_010;
            6: bcd_out = 7'b0000_010;
            7: bcd_out = 7'b1111_000;
            8: bcd_out = 7'b0000_000;
            9: bcd_out = 7'b0011_000;
            default: bcd_out = 7'b1111_111;
        endcase
    end

endmodule