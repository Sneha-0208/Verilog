//Verilog code for a Half Adder using Gate-Level Modeling

//DUT for Half Adder using Gate level modeling

module half_adder(a,b,s,c);
  input a,b;
  output s,c;
  xor (s,a,b);
  and (c,a,b);
endmodule
  

//Testbench

module tb;
  reg a,b;
  wire s,c;
  
  half_adder(a,b,s,c);
    initial
      begin
        for(integer i = 0; i < 4; i+=1)
          begin
            {a,b}=i;
            #2;
          end
      end
  initial
    begin
      $monitor("sim time=%0t ns | a=%b | b=%b| sum=%b | carry=%b",$time,a,b,s,c);
    end
endmodule
       
