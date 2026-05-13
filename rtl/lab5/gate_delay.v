/*
  Module: Gate Delay Test Module
  Author: William Woo
  Date Created: 13-July-2023
  Version: 0.1
*/

module gate_delay (
    out, a, b, c);

// I/O port declarations
output out;
input a,b,c;

// Internal nets
wire e;

// Instantiate primitive gates to build the circuit
and #(5) a1(e, a, b); //Delay of 5 on gate a1
or #(4) o1(out, e,c); //Delay of 4 on gate o1

endmodule

