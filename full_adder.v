module full_adder(sum,c_out,a,b,c_in);
  output c_out;
  output sum;
  input a;
  input b;
  input c_in
  assign sum = a^b^c;
  assign c_out = a&b&c;
  