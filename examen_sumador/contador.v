module contador(
	input clk,
	input rst,
	input start,
	input [3:0] value,
	output reg [7:0] sum // Suma maxima es 136
);


// Contador local
reg [3:0] count;

// Suma y contador en un mismo bloque
always @(posedge clk or posedge rst) begin
	if(rst) begin						// Condiciones en reinicio
		count <= 0;
		sum <= 0;
	end
	else if(start) begin
		if(count > value) begin    // Se suma la cuenta en start
			count <= count;
			sum <= sum;
		end
		else begin
			count <= count + 1;
			sum <= sum + count;
		end
	end
	else begin							// No hay suma
		count <= 0;
		sum <= 0;
	end
end	


endmodule