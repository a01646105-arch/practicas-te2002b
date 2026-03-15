module UART #(parameter BAUD_RATE = 9_600, parameter CLOCK_FREQ = 50_000_000, BITS = 8)(
    
    // Variables generales
    input reg clk,
    input reg rst,
    
    // Variables de módulo TX
    input reg [BITS-1:0] data_in,
    input reg start,
    output wire tx_out,
    output wire busy
    
    // Variables de módulo RX
    input reg rx_in,
	output wire [7:0] data_out,
	output wire data_ready
);

UART_Tx #(.BAUD_RATE(9_600), .CLOCK_FREQ(50_000_000), .BITS(8)) UART_TX (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .start(start),
    .tx_out(tx_out),
    .busy(busy)
);

UART_Rx #(.BAUD_RATE(9_600), .CLOCK_FREQ(50_000_000), .BITS(8)) UART_RX (
    .clk(clk),
    .rst(rst),
    .rx_in(rx_in),
    .data_out(data_out),
    .data_ready(data_ready)
);

endmodule