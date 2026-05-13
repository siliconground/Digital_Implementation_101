`timescale 1ns / 1ps
/*
  Module: 4-input Multiplexer(Gate Level)
  Author: William Woo
  Date Created: 15-July-2023
  Version: 0.1
*/

module mux_4_to_1_gate (
out, in0, in1, in2, in3, s0, s1
);

output out;
input wire in0, in1, in2, in3;
input wire s0, s1;

wire s0bar, s1bar;
wire a0, a1, a2, a3;
// gate level modeling
not (s0bar, s0);
not (s1bar, s1);

and (a0, s1bar, s0bar, in0);
and (a1, s1bar, s0, in1);
and (a2, s1, s0bar, in2);
and (a3, s1, s0, in3);


or (out, a0, a1, a2, a3);


endmodule
	
