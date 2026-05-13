/*
  Module: 4-bit full adder Stimulus
  Author: William Woo
  Date Created: 12-July-2023
  Version: 0.2
*/
module stimulus;

reg [3:0] A, B;
reg C_IN;
wire [3:0] SUM;
wire C_OUT;


fulladd4 FA1_4(SUM, C_OUT, A, B, C_IN);


initial begin
    A = 4'd0; B = 4'd0; C_IN = 1'b0;
    #5 A = 4'd3; B = 4'd4;
    #5 A = 4'd2; B = 4'd5;
    #5 A = 4'd9; B = 4'd9;
    #5 A = 4'd10; B = 4'd15;
    #5 A = 4'd10; B = 4'd5; C_IN = 1'b1;
end

endmodule
