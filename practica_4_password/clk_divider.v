module clk_divider #(
	parameter DESIRED_FREQ = 1,
	parameter CLK_FREQ = 50_000_000 // FPGA freq
) (
    input CLK, RST,
    output reg clk_div
);

reg [31:0] count;

parameter max_count = CLK_FREQ / (2 * DESIRED_FREQ);

always @(posedge CLK or posedge RST)
    begin
        if (RST)
            count <= 0;
        else if (count >= max_count-1)
            count <= 0;
        else
            count <= count + 1;
    end

always @(posedge CLK or posedge RST)
    begin
        if (RST)
            clk_div <= 0;
        else if (count >= max_count-1)
            clk_div <= ~clk_div;
        else
            clk_div <= clk_div;
    end

endmodule