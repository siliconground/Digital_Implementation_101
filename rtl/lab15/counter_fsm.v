`timescale 1ns / 1ps
module counter_fsm (
	// port list
	clk, rst_n, o_cnt
);

// port declaration
input wire clk;
input wire rst_n;
output wire [1:0] o_cnt;

reg [1:0] current_state;
reg [1:0] next_state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;


// status register
always @(posedge clk, negedge rst_n) 
begin
	if ( ~rst_n ) current_state <= 1'b0;
	else current_state <= next_state;
end

// nest state logic
always @(*) 
begin
	case (current_state )
		S0: next_state = S1;
		S1: next_state = S2;
		S2: next_state = S3;
		S3: next_state = S0;
	endcase
end

// output logic
assign o_cnt = current_state;

	
endmodule
