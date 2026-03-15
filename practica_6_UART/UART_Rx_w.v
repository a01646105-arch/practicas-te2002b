module UART_Rx_w #(
    parameter BAUD_RATE = 9_600, 
    parameter CLOCK_FREQ = 50_000_000, 
    BITS = 8
)(
    input MAX10_CLK1_50,
    input [1:0] KEY,
    output [15:0] ARDUINO_IO,
    output [6:0] HEX0, HEX1, HEX2,
    output [9:0] LEDR
);

// Señal intermedia que guarda dato recibido
wire [BITS-1:0] data_out;

UART_Rx #(
    .BAUD_RATE(BAUD_RATE),
    .CLOCK_FREQ(CLOCK_FREQ)
) WRAP(
    .clk(MAX10_CLK1_50),
    .rst(~KEY[0]),
    .rx_in(ARDUINO_IO[0]),
    .data_out(data_out),
    .data_ready(LEDR[0])
)

bcd_3displays #(
	.N_in(BITS-1),
	.N_out(7)
) displays(
	.bcd_in(data_out),
	.D_un(HEX0),
	.D_de(HEX1),
	.D_ce(HEX2)
);


endmodule