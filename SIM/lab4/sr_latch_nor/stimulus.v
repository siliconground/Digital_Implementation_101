
// module definition
module stimulus ();

// set stimulus vars
wire q, qbar;
reg set, reset;


// DUT(SR latch) instantiation
sr_latch_nor sr_latch2
(	.Q(q), .Qbar(qbar), .S(set), .R(reset));

// Behavioral block for testing

initial begin
	$monitor($time, " set = %b, reset = %b, q = %b, qbar = %b\n", set, reset, q, qbar);
	// t=0: set=0, reset=0
	set = 0; reset = 0;

	// t=5: set=1, reset=0
	#5 set = 1;
	
	// t=10: set=0, reset=0
	#5 set = 0;
	
	// t=15: set=0, reset=1
	#5 reset = 1;

	// t=20: set=0, reset=0
	#5 reset = 0;

	// t=25: set=1, reset=1(forbidden)
	#5 set = 1; reset = 1;
	#5 $finish;

end


	
endmodule
