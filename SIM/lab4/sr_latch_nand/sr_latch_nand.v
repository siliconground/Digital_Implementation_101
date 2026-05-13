/*
  Module: SR(Set/Reset) latch
  Author: William Woo
  Date Created: 11-July-2023
  Version: 0.1
*/

module sr_latch_nand (
    // port list
    Q, Qbar, Sbar, Rbar
);

// port IO declarations
output Q, Qbar;
input Sbar, Rbar;

// Instantiation of two NAND primitive
nand nand1(Q, Sbar, Qbar);
nand nand2(Qbar, Rbar, Q);
    
endmodule
