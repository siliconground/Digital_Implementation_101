/*
  Module: 4-bit full adder(data flow modeling)
  Author: William Woo
  Date Created: 15-July-2023
  Version: 0.1
*/

module fulladd4(sum, c_out, a, b, c_in);

// I/O port declarations
output [3:0] sum;
output c_out;
input[3:0] a, b;
input c_in;

// Specify the function of a full adder
assign {c_out, sum} = a + b + c_in;

endmodule


