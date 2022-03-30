`timescale 1ns/1ps
module comparator_4bit(eq,greater,lesser,a,b);
  input [3:0] a;
  input [3:0] b;
  output eq, greater , lesser;
  wire [3:0]x;
  assign x[0]= ~(a[0]^b[0]),
         x[1]= ~(a[1]^b[1]),
         x[2]= ~(a[2]^b[2]),
         x[3]= ~(a[3]^b[3]);

  assign eq=&x;
  assign greater = (a[3]&!b[3])|(x[3]&a[2]&!b[2])|(x[3]&x[2]&a[1]&!b[1])|(x[3]&x[2]&x[1]&a[0]&!b[0]);
  assign lesser = (!a[3]&b[3])|(x[3]&!a[2]&b[2])|(x[3]&x[2]&!a[1]&b[1])|(x[3]&x[2]&x[1]&!a[0]&b[0]); 

endmodule
module tb_comparator_4bit;
  // 1. Declare testbench variables
   reg [3:0] a;
   reg [3:0] b;
   wire eq,greater,lesser;

  // 2. Instantiate the design and connect to testbench variables
  comparator_4bit comp(eq,greater,lesser,a,b);
  // 3. Provide stimulus to test the design
   initial begin
      a <= 0;
      b <= 0;

      
      $monitor ("a=0x%0h b=0x%0h equal=0x%0h greater=0x%0h lesser=0x%0h", a, b, eq, greater, lesser);

    // Use a for loop to apply random values to the input
      // for (i = 0; i < 5; i = i+1) begin
         #10 a <= 4'b1001;
             b <= 4'b1001;
         #10 a <= 4'b1010;
             b <= 4'b1100;
         #10 b <= 4'b1010;
             a <= 4'b1100;    
      // end
   end

endmodule
