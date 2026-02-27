`timescale 1ns/1ps

module password_tb();

reg CLK, RST, check;
reg [3:0] num;
wire [6:0] digit1, digit2, digit3, digit4;

password #(
	.password(16'h1234), 
	.DESIRED_FREQ(50),
	.CLK_FREQ(100)
) DUT(
	.CLK(CLK),
	.RST(RST),
	.check(check),
	.num(num),
	.digit1(digit1),
	.digit2(digit2),
	.digit3(digit3),
	.digit4(digit4)
	// LED is ignored for testbench
);

initial CLK = 0;
always #1 CLK = ~CLK;

initial begin
	check = 0;
	RST <= 1;
	num = 0; #10; // Reset everything
	
	RST <= 0; #20;
	
	num = 4;
	check = 1; #3; check = 0; #9;
	
	num = 3;
	check = 1; #3; check = 0; #9;
	
	num = 2;
	check = 1; #3; check = 0; #9;
	
	num = 1;
	check = 1; #3; check = 0; #9;
	
	RST <= 1; #9;
	RST <= 0; #9;
	
	repeat(5) // If the first number doesnt match, currenty will stay at 5
	begin
		num = $random%10;
		check = 1; #3; check = 0; #9;
	end
	
	$stop;
	$finish;
end

endmodule