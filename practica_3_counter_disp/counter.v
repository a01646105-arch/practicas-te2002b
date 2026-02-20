module counter #(parameter CMAX = 100)(
    input CLK, RST,
	 input [7:0] data_in,
	 input load,
	 input up_down,
    output reg [6:0] count
);

always @(posedge CLK or posedge RST)
    begin
        if (RST)
            count <= 0;
		  else if (load)
				count <= data_in;
		  else if (up_down)
				if (count == 0)
					count <= CMAX;
				else
					count <= count - 1;
        else
				if (count == CMAX)
					count <= 0;
				else
					count <= count + 1;
    end

endmodule