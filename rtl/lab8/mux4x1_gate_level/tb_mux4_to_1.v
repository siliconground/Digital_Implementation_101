`timescale 1ns / 1ps

module tb_mux_4_to_1 (); // top module(no need port)

// declaration stimulus signal
 wire out;
 reg in0;
 reg in1;
 reg in2;
 reg in3;
 reg sel1;
 reg sel0;

// instantiation of DUT
 mux_4_to_1_gate DUT
 (
	 .out(out),
	 .in0(in0),
	 .in1(in1), 
	 .in2(in2), 
	 .in3(in3), 
	 .s0(sel0), 
	 .s1(sel1)
 );

task display;
	begin
		$display
		(
			"$time=%0d", $time, " ns"
			, " sel1 = ", sel1
			, " sel0 = ", sel0
			, " in0 = ", in0
			, " in1 = ", in1
			, " in2 = ", in2
			, " in3 = ", in3
			, " out = ", out
		);
	end
endtask


initial begin
	sel1 = 0 ; sel0 = 0 ; in0 = 1 ; in1 = 0 ; in2 = 0 ; in3 = 0 ; #10 ; display;
	sel1 = 0 ; sel0 = 1 ; in0 = 0 ; in1 = 1 ; in2 = 0 ; in3 = 0 ; #10 ; display;
	sel1 = 1 ; sel0 = 0 ; in0 = 0 ; in1 = 0 ; in2 = 1 ; in3 = 0 ; #10 ; display;
	sel1 = 1 ; sel0 = 1 ; in0 = 0 ; in1 = 0 ; in2 = 0 ; in3 = 1 ; #10 ; display;
	$finish;
end

	
endmodule
