`timescale 1ns / 1ps

module traffic_signal_fsm (
	// port list
	clk, 
	rst_n, 
	i_ta, i_tb, // pedestrian sensor input
	o_sa, o_sb // signal light output
);

// port declaration
input clk;
input rst_n;
input i_ta, i_tb;
output reg [1:0] o_sa, o_sb;

// internal register
reg [1:0] c_state, n_state;

// current state parameter
localparam S0 = 2'b00;
localparam S1 = 2'b01;
localparam S2 = 2'b11;
localparam S3 = 2'b10;

// signal color parameter
localparam  RED 	= 2'b00;
localparam 	YELLOW 	= 2'b01;
localparam  GREEN 	= 2'b10;


// 1.status register
always @(posedge clk, negedge rst_n) 
begin
	if ( ~rst_n ) c_state <= S0;
	else c_state <= n_state;
end

// 2.next state logic: here must be no latch
always @( c_state, i_ta, i_tb) 
begin
	case ( c_state )
		S0: if ( ~i_ta ) n_state = S1;
			else n_state = S0; // remain current state
		S1: n_state = S2; // automatic transition
		S2: if ( ~i_tb ) n_state = S3;
			else n_state = S2;
		S3: n_state = S0;
		default: n_state = S0; 
	endcase
end

// 3.output logic
always @( c_state ) 
begin
	if ( c_state == S0 )
	begin
		o_sa = GREEN;
		o_sb = RED;
	end
	else if ( c_state == S1 )
	begin
		o_sa = YELLOW;
		o_sb = RED;
	end
	else if ( c_state == S2 )
	begin
		o_sa = RED;
		o_sb = GREEN;
	end
	else if ( c_state == S3 )
	begin
		o_sa = RED;
		o_sb = YELLOW;
	end
end

endmodule
