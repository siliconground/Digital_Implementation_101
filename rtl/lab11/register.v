`timescale 1ns / 1ps

module register (
	rst_n, 
	clk, 
	in1, 
	in2, 
	out1, 
	out2
); // port list

// port declaration and IO direction
input rst_n;
input clk;
input in1;
input [3:0] in2; // 4bit input
output out1;
output [3:0] out2; // 4bit output


// behavioral modeling: 1-bit register
reg out1;
always @(posedge clk or negedge rst_n) 
begin
	if ( rst_n == 0 ) out1 <= 1'b0; // active low | rst enable
	else out1 <= in1;
end



// behavioral meodeling: 4-bit register
reg [3:0] out2;
always @(posedge clk, negedge rst_n) 
begin
	if ( rst_n == 0 ) out2 <= 4'b0;
	else out2 <= in2;
end
	
endmodule
