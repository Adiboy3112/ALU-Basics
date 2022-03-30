module half_adder(sum,carry,x,y);
  input x;
  input y;
  output sum;
  output carry;
  assign sum=x^y;
  assign carry=x&y;
endmodule