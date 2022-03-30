`timescale 1ns/1ps
module full_adder(sum,c_out,a,b,c_in);
  output c_out;
  output sum;
  input a;
  input b;
  input c_in;
  assign sum = a^b^c_in;
  assign c_out = a&b&c_in;
endmodule

module carry_ahead_adder(sum,c_out,a,b,c_in);

  input [3:0] a;
  input [3:0] b;
  input  c_in;
  output [3:0] sum;
  wire [3:0] c;
  wire [3:0] g;
  wire [3:0] p;
  output c_out;

  assign g[0]= a[0]&b[0],
         g[1]= a[1]&b[1],
         g[2]= a[2]&b[2],
         g[3]= a[3]&b[3];

  assign p[0]= a[0]|b[0],
         p[1]= a[1]|b[1],
         p[2]= a[2]|b[2],
         p[3]= a[3]|b[3];

  assign c[0]= c_in,
         c[1]= g[0]|(p[0]&c[0]),
         c[2]= g[1]|(p[1]&c[1]),
         c[3]= g[2]|(p[2]&c[2]),
         c_out= g[3]|(p[3]&c[3]);

  full_adder fa0(.sum(sum[0]),.c_out(),.a(a[0]),.b(b[0]), .c_in(c[0]));
  full_adder fa1(.sum(sum[1]),.c_out(),.a(a[1]),.b(b[1]), .c_in(c[1]));
  full_adder fa2(.sum(sum[2]),.c_out(),.a(a[2]),.b(b[2]), .c_in(c[2]));
  full_adder fa3(.sum(sum[3]),.c_out(),.a(a[3]),.b(b[3]), .c_in(c[3]));

endmodule // module
module tb;
  initial begin
    $display("Module compiled");
  end
endmodule





