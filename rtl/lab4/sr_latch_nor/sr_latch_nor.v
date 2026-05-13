module sr_latch_nor (
	Q, Qbar, S, R	
);	

// Port IO declaration based on IEEE2001
input S, R;
output Q, Qbar;

// primitive gate instantiation
// Two nor gates are needed to construct SR latch

nor nor1 (Q, R, Qbar);
nor nor2 (Qbar, S, Q);


endmodule
