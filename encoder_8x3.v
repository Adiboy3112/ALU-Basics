module encoder_8x3 (out,a0,a1,a2,a3,a4,a5,a6,a7);
  input a0,a1,a2,a3,a4,a5,a6,a7;
  output [2:0] out;
  assign out[0]=a1|a3|a5|a7,
         out[1]=a2|a6|a3|a7,
         out[2]=a4||a5|a6|a7;

endmodule
module tb_encoder_8x3;
  // 1. Declare testbench variables
   reg a0,a1,a2,a3,a4,a5,a6,a7;
   wire [2:0]out;

  // 2. Instantiate the design and connect to testbench variables
  encoder_8x3 d1(out,a0,a1,a2,a3,a4,a5,a6,a7);
  // 3. Provide stimulus to test the design
   initial begin
      a0 <= 0;
      a1<= 0;
      a2<= 0;
      a3<=0;
      a4<=0;
      a5<=0;
      a6<=0;
      a7<=0;
   
    $monitor ("a%d is %b",out,out);

    // Use a for loop to apply random values to the input
      // for (i = 0; i < 5; i = i+1) begin
      #10 a0<=0;
          a1<=0;
          a2<=0;
          a3<=0;
          a4<=0;
          a5<=0;
          a6<=0;
          a7<=0;
      #10 a0<=0;
          a1<=1;
          a2<=0;
          a3<=0;
          a4<=0;
          a5<=0;
          a6<=0;
          a7<=0;
      #10 a0<=0;
          a1<=0;
          a2<=0;
          a3<=0;
          a4<=1;
          a5<=0;
          a6<=0;
          a7<=0;
      #10 a0<=0;
          a1<=0;
          a2<=0;
          a3<=0;
          a4<=0;
          a5<=0;
          a6<=1;
          a7<=0;


       

      // end
   end

endmodule


