module num_primos(
   input [3:0] In,
   output reg LED
);

always @(*)
	begin
		case(In)
			4'b0010: LED = 1'b1;
         4'b0011: LED = 1'b1;
         4'b0101: LED = 1'b1;
         4'b0111: LED = 1'b1;
         4'b1011: LED = 1'b1;
         4'b1101: LED = 1'b1;
         default: LED = 1'b0;
      endcase
   end

endmodule