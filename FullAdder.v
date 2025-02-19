// DUT for Full adder using behavioral style of modeling

module full_adder(a,b,cin,sum,carry);
  input a,b,cin;
  output reg sum,carry;
  always @(a,b,cin)
  begin 
    //we use blocking assignment for combinational circuits
    sum = a^b^cin;
    carry = a&b | b&cin | a&cin;
    
    //can directly use {carry, sum} = a+b+c;
  end
endmodule


//Testbench for Full Adder using behavioral modeling

module tb;
  reg a,b,cin;
  wire sum, carry;
  
  full_adder dut(a,b,cin,sum,carry);
  initial
    begin
      for(integer i = 0; i < 8; i = i+1)
        begin
          {a,b,cin}=i;
          #2;
        end
    end
  initial
  begin
    $monitor("sim time=%0t ns, a=%b, b=%b, c=%b, sum=%b, carry=%b",$time, a,b,cin,sum,carry);
  end
endmodule
