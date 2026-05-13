/*
  Module: Gate Delay Stimulus
  Author: William Woo
  Date Created: 13-July-2023
  Version: 0.1
*/

module stimulus;

// Declare variables
reg A, B, C;
wire OUT;

// Instantiate the module D
gate_delay d1( OUT, A, B, C);

// Stimulus
initial
begin
A= 1'b0; B= 1'b0; C= 1'b0;
#10 A= 1'b1; B= 1'b1; C= 1'b1;
#10 A= 1'b1; B= 1'b0; C= 1'b0;
#20 $finish;
end
endmodule



