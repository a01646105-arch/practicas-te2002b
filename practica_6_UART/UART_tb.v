module UART_tb #(
    parameter BAUD_RATE = 9600, 
    parameter CLOCK_FREQ = 50000000, 
    parameter BITS = 8
)();

// Señales para transmisor
reg clk;
reg rst;
reg [BITS-1:0] data_in;
reg start;
// wire tx_out;
wire busy;

// Señal intermedia
wire UART_wire;      // Conexión entre Tx y Rx

// Señales para el receptor
// reg rx_in;
wire [BITS-1:0] data_out;
wire data_ready;

// Instancia del DUT
UART #(
    .BAUD_RATE(BAUD_RATE),
    .CLOCK_FREQ(CLOCK_FREQ),
    .BITS(BITS)
) DUT(
    // Señales generales
    .clk(clk),
    .rst(rst),
    
    // Señales para Tx
    .data_in(data_in),
    .start(start),
    .tx_out(UART_wire),
    .busy(busy),

    // Señales para Rx
    .rx_in(UART_wire),
    .data_out(data_out),
    .data_ready(data_ready)
);

// Reloj 50 MHz
always #10 clk = ~clk;

initial begin
    clk <= 0;
    rst <= 0;
    data_in <= 0;
    start <= 0;
end

initial begin

    $display("Simulación iniciada");

    // Reset
    #30;
    rst <= 1;
    #20;
    rst <= 0;

    #20000;        // Demora para estabilizar el sistema

    repeat(10) begin

        wait(!busy);               // Esperar a que TX esté libre

        data_in = $random % 256;

        start = 1;
        @(posedge clk);            // Pulso de un ciclo
        start = 0;

        @(posedge data_ready);     // Esperar recepción completa

        $display("Dato transmitido: %b, Dato recibido: %b", data_in, data_out);

    end

    $display("Fin de simulación");
    $stop;

end

endmodule