module password #(parameter [15:0] password = 16'h1234, FREQ = 1)(
	input CLK, RST, check,
	input [3:0] num,
	output reg [6:0] digit1, digit2, digit3, digit4,
	output reg [9:0] LED
);

// Clock divider
wire clk_d;

clk_divider #(.FREQ(FREQ)) CLK_DIV(
	.CLK(CLK),
	.RST(RST),
	.clk_div(clk_d)
);

// Set 7 states as parameters
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;


// Define state variables
reg [2:0] state, next;


// Current state
always @(posedge clk_d or posedge RST)
begin
	if(RST)
		state <= S0;
	else if(check)
		state <= next;
	else
		state <= state;
end

// Next state
always @(*)
begin
	case(state)
		S0: // Idle state
			if(num == password[3:0])
				next = S1;
			else
				next = S5; // Display "bAd", waits for reset to continue
				
		S1: // First digit correct
			if(num == password[7:4])
				next = S2;
			else
				next = S5;
				
		S2: // Second digit correct
			if(num == password[11:8])
				next = S3;
			else
				next = S5;
				
		S3: // Third digit correct
			if(num == password[15:12])
				next = S4;
			else
				next = S5; 
				
		S4: // Fourth digit correct
			next = S4; // Display "Good", waits for reset to continue
		
		S5:
			next = S5; // Stay here until reset
			
		default:
			next = S0;
			
	endcase
end

// Instantiate all potential output cases
wire [6:0] int_d1, int_d2, int_d3, int_d4; // Internal wires to instantiate module

BCD_module digit_1(.BCD_in(password[3:0]), .BCD_out(int_d1));
BCD_module digit_2(.BCD_in(password[7:4]), .BCD_out(int_d2));
BCD_module digit_3(.BCD_in(password[11:8]), .BCD_out(int_d3));
BCD_module digit_4(.BCD_in(password[15:12]), .BCD_out(int_d4));


// Output logic
always @(*)
begin

	// Default value: zero
	{digit4, digit3, digit2, digit1} = {4{7'b1000_000}};
	
	// Default values for LEDs
	LED = 0; // All off
	
	case(state)
		S0: begin
			// Keep all displays to output zero
			{digit4, digit3, digit2, digit1} = {4{7'b1000_000}};
		end
		
		S1: begin
			digit1 = int_d1;
			LED[S0] = 1;
		end	
			
		S2: begin
			digit1 = int_d1;
			digit2 = int_d2;
			LED[S1:S0] = 2'b11;
		end	
			
		S3: begin
			digit1 = int_d1;
			digit2 = int_d2;
			digit3 = int_d3;
			LED[S2:S0] = 3'b111;
		end
		
		S4: begin
			digit4 = 7'b0000_010; // Display letter "G"
			{digit3, digit2} = {2{7'b0100_011}}; // Display letter "o"
			digit1 = 7'b0100_001; // Display letter "d"
			LED[S3:S0] = 4'b1111;
		end	
		
		S5: begin
			digit4 = 7'b1111_111; // Turn off fourth display
			digit3 = 7'b0000_011; // Display letter "b"
			digit2 = 7'b0001_000; // Display leter "A"
			digit1 = 7'b0100_001; // Display letter "d"
			LED[S4] = 1;
		end
		
	endcase
end

endmodule