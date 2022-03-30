module half_adder(sum,carry,x,y);
  input x;
  input y;
  output sum;
  output carry;
  assign sum=x^y;
  assign carry=x&y;
endmodule

module binary_multiplier(product,a,b);
  input [1:0] a;
  input [1:0] b;
  output [3:0] product;
  wire r;
  wire [1:0] w1;
  wire [1:0] w2;
  assign w1[0]= a[0]&b[0];
  assign w1[1]= a[0]&b[1];
  assign w2[0]= a[1]&b[0];
  assign w2[1]= a[1]&b[1];
  assign product[0]= w1[0];
  half_adder ha1(product[1],r,w1[1],w2[0]);
  half_adder ha2(product[2],product[3],w2[1],r);
endmodule // binary_multiplier

// module tb_binary_adder;
//   // 1. Declare testbench variables
//    reg [1:0] a;
//    reg [1:0] b;
//    wire [3:0] product;
//    integer i;

//   // 2. Instantiate the design and connect to testbench variables
//   binary_multiplier ba1(product,a,b);

//   // 3. Provide stimulus to test the design
//    initial begin
//       a <= 0;
//       b <= 0;

      
//       $monitor ("a=0x%0h b=0x%0h product=0x%0h", a, b, product);

//     // Use a for loop to apply random values to the input
//       // for (i = 0; i < 5; i = i+1) begin
//          #10 a <= 2'b01;
//              b <= 2'b10;
//          #10 a <= 2'b10;
//              b <= 2'b11;
//       // end
//    end
// endmodule
