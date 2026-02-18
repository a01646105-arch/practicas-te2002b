module BCD_w #(parameter N_in = 10, N_out = 7)(
    input [N_in-1:0] SW,
    output [N_out-1:0] HEX0, HEX1, HEX2, HEX3 
);

BCD_4displays WRAP(
    .bcd_in(SW),
    .D_un(HEX0),
    .D_de(HEX1),
    .D_ce(HEX2),
    .D_mi(HEX3)
);

endmodule
