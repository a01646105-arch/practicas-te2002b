`timescale 1ns / 1ps

module password_tb();

reg CLK, RST, check;
reg [3:0] num;
wire [6:0] digit1, digit2, digit3, digit4;

password #(
	.password(16'h1234), 
	.FREQ(1_000_000)
) DUT(
	.CLK(CLK),
	.RST(RST),
	.check(check),
	.num(num),
	.digit1(digit1),
	.digit2(digit2),
	.digit3(digit3),
	.digit4(digit4)
);

initial begin
	CLK <= 0;
	forever #10 CLK <= ~CLK;
end

initial begin
	check <= 0;
	RST <= 1;
	num = 0; #20;
	RST <= 0; #30;
	num = 4;
	check = 1; #20; check = 0; #20;
	num = 3;
	check = 1; #20; check = 0; #20;
	num = 2;
	check = 1; #20; check = 0; #20;
	num = 1;
	check = 1; #20; check = 0; #40;
	
	RST <= 1; #20;
	RST <= 0; #20;
	
	repeat(10) // If the first number doesnt match, currenty will stay at 5
	begin
		num = ($random % 10);
		check = 1; #20; check = 0; #20;
	end
	
	$stop;
	$finish;
end

endmodule