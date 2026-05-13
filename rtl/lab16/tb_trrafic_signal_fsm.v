`timescale 1ns / 1ps

module tb_trrafic_signal_fsm ();

// stimulus signal declaration
reg clk, rst_n;
reg i_ta, i_tb;
wire [1:0] o_sa, o_sb;

parameter CLK_PERIOD = 10;

// reset signal
initial 
begin
	rst_n = 1'b1;
	
	#13
	rst_n = 1'b0;

	#(CLK_PERIOD / 2) rst_n = 1'b1;
end


// clock generation
always
begin
	clk = 1'b0;
	forever #(CLK_PERIOD / 2) clk = ~clk;
end

// input stimuls
initial 
begin
	i_ta = 1'b0; i_tb = 1'b0; #3
	i_ta = 1'b0; i_tb = 1'b1; #(CLK_PERIOD)
	i_ta = 1'b1; i_tb = 1'b0; #(CLK_PERIOD)
	i_ta = 1'b0; i_tb = 1'b1; #(CLK_PERIOD)
	i_ta = 1'b0; i_tb = 1'b0; #50
	$finish;
end

// DUT instantiation
traffic_signal_fsm DUT (
	.clk (clk), 
	.rst_n (rst_n), 
	.i_ta (i_ta), .i_tb (i_tb), 
	.o_sa (o_sa), .o_sb(o_sb)

);










endmodule
