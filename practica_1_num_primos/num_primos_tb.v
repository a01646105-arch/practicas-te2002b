`timescale 1ns/100ps

module num_primos_tb();

reg [3:0] In;
wire LED;

num_primos DUT(
	.In(In),
   .LED(LED)
);

initial
   begin 
		$display("Simulación iniciada");
      In = 4'b0000; #10
      In = 4'b0001; #10
      In = 4'b0010; #10
      In = 4'b0011; #10
      In = 4'b0100; #10
      In = 4'b0101; #10
      In = 4'b0110; #10
      In = 4'b0111; #10
      In = 4'b1000; #10
      In = 4'b1001; #10
      In = 4'b1010; #10
      In = 4'b1011; #10
      In = 4'b1100; #10
      In = 4'b1101; #10
      In = 4'b1110; #10
      In = 4'b1111; #10
      $display("Simulación finalizada");

      $stop;
      $finish;
	end

initial
   begin
      $monitor("Input = %b, Dec = %d, LED = %b", In, In, LED);
   end

// Visualización de ondas de la simulacion con oss-cad-suite
/*
initial
    begin
        $dumpfile("num_primos_tb.vcd");
        $dumpvars(0, num_primos_tb);
    end
*/

endmodule