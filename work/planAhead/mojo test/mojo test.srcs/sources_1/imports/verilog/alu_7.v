/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_7 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] alu,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_add_sum;
  wire [1-1:0] M_add_z;
  wire [1-1:0] M_add_v;
  wire [1-1:0] M_add_n;
  reg [16-1:0] M_add_a;
  reg [16-1:0] M_add_b;
  reg [6-1:0] M_add_alufn;
  alu_add16_41 add (
    .a(M_add_a),
    .b(M_add_b),
    .alufn(M_add_alufn),
    .sum(M_add_sum),
    .z(M_add_z),
    .v(M_add_v),
    .n(M_add_n)
  );
  
  wire [16-1:0] M_comp_compare;
  reg [1-1:0] M_comp_z;
  reg [1-1:0] M_comp_v;
  reg [1-1:0] M_comp_n;
  reg [6-1:0] M_comp_alufn;
  alu_comp16_42 comp (
    .z(M_comp_z),
    .v(M_comp_v),
    .n(M_comp_n),
    .alufn(M_comp_alufn),
    .compare(M_comp_compare)
  );
  
  wire [16-1:0] M_bool_bool;
  reg [16-1:0] M_bool_a;
  reg [16-1:0] M_bool_b;
  reg [6-1:0] M_bool_alufn;
  alu_bool16_43 bool (
    .a(M_bool_a),
    .b(M_bool_b),
    .alufn(M_bool_alufn),
    .bool(M_bool_bool)
  );
  
  wire [16-1:0] M_shift_shift;
  reg [16-1:0] M_shift_a;
  reg [4-1:0] M_shift_b;
  reg [6-1:0] M_shift_alufn;
  alu_shift16_44 shift (
    .a(M_shift_a),
    .b(M_shift_b),
    .alufn(M_shift_alufn),
    .shift(M_shift_shift)
  );
  
  always @* begin
    M_add_a = a;
    M_add_b = b;
    M_add_alufn = alufn;
    M_comp_z = M_add_z;
    M_comp_v = M_add_v;
    M_comp_n = M_add_n;
    M_comp_alufn = alufn;
    M_bool_a = a;
    M_bool_b = b;
    M_bool_alufn = alufn;
    M_shift_a = a;
    M_shift_b = b[0+3-:4];
    M_shift_alufn = alufn;
    
    case (alufn[4+1-:2])
      2'h0: begin
        alu = M_add_sum;
      end
      2'h1: begin
        alu = M_bool_bool;
      end
      2'h2: begin
        alu = M_shift_shift;
      end
      2'h3: begin
        alu = M_comp_compare;
      end
      default: begin
        alu = 1'h0;
      end
    endcase
    z = M_add_z;
    v = M_add_v;
    n = M_add_n;
  end
endmodule
