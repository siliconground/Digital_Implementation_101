
/*
  Module: 1-bit fulladder including 2 HA
  Author: William Woo
  Date Created: 12-July-2023
  Version: 0.1
*/
module fulladd (
    sum, c_out, a, b, c_in
);

output wire sum, c_out;
input wire a, b, c_in;

wire s1, c1, c2;

// HA1
xor (s1, a, b);
and (c1, a, b);

// HA2
xor (sum, s1, c_in);
and (c2, s1, c_in);

// HA1 + HA2
or (c_out, c2, c1);

endmodule
