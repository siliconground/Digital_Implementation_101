module stimulus;

// set stimulus vars
wire q, qbar;
reg set, reset;


// SR latch(DUT) instantiation

sr_latch_nand sr_latch1
(
	// enumeration by name and order
    .Q(q), .Qbar(qbar), .Sbar(~set), .Rbar(~reset)
);
	
	
// Behavior Block for testing

initial
begin
    $monitor($time, " set = %b, reset= %b, q= %b\n",set,reset,q);
    // ~set=1, ~reset=1
	set = 0; reset = 0;

	// ~set=1, ~reset=0
    #5 reset = 1;

	// ~set=1, ~reset=1
    #5 reset = 0;

	// ~set=0, ~reset=1
    #5 set = 1;

	// ~set=1, ~reset=1
	#5 set = 0;

	// ~set=0, ~reset=0
	#5 set = 1; reset = 1;
    #5 $finish;
end

endmodule
