module decoder_3x8(d,a2,a1,a0,enable);
  input a0,a1,a2;
  input enable;
  output [7:0]d;
  and 
      G0(d[0],!enable,!a0,!a1,!a2),
      G1(d[1],!enable,a0,!a1,!a2),
      G2(d[2],!enable,!a0,a1,!a2),
      G3(d[3],!enable,a0,a1,!a2),
      G4(d[4],!enable,!a0,!a1,a2),
      G5(d[5],!enable,a0,!a1,a2),
      G6(d[6],!enable,!a0,a1,a2),
      G7(d[7],!enable,a0,a1,a2);
  
  endmodule

module tb_decoder_3x8;
  // 1. Declare testbench variables
   reg a0,a1,a2,enable;
   wire [7:0]d;
   wire a;

    assign a={a2,a1,a0};
  // 2. Instantiate the design and connect to testbench variables
  decoder_3x8 d1(d,a2,a1,a0,enable);
  // 3. Provide stimulus to test the design
   initial begin
      a0 <= 0;
      a1<= 0;
      a2<= 0;
      enable<=0;
   
    $monitor ("a=3b%0b%0b%0b d6 is %b ", a2,a1,a0,d[6]);

    // Use a for loop to apply random values to the input
      // for (i = 0; i < 5; i = i+1) begin
         #10 a0 <=1'b1;
             a1 <= 1'b0;
             a2 <= 1'b0;
         #10 a0 <=1'b1;
             a1 <= 1'b0;
             a2 <= 1'b1;
         #10 a0 <=1'b0;
             a1 <= 1'b1;
             a2 <= 1'b1;    
      // end
   end

endmodule

