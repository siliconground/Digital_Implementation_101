`timescale 1ns / 1ps
/*
  Module: 4-input Multiplexer(Data Flow)
  Author: William Woo
  Date Created: 15-July-2023
  Version: 0.1
*/
/*
module mux4_to_1 (out, i0, i1, i2, i3, s1, s0);

// Port declarations from the I/O diagram
output 	out					;
input 	i0, i1, i2, i3		;
input 	s1, s0				;

//Logic equation for out

assign out = (~s1 & ~s0 & i0)|

             (~s1 & s0 & i1) |
             (s1 & ~s0 & i2) |
             (s1 & s0 & i3) ;
endmodule

*/
module mux4_to_1 (out, i0, i1, i2, i3, s1, s0);

output out;
input i0, i1, i2, i3;
input s1, s0;

// nested conditional operator
assign out = s1 ? ( s0 ? i3 : i2) : (s0 ? i1 : i0) ;

endmodule
























