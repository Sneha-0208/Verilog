//DUT for 2x1 MUX using behavioral style of modeling

module mux_2to1(i0,i1,s,y);
  input i0,i1,s;
  output reg y;
  always @(i0,i1,s)
    begin
      y = i0&(~s) | i1&s;
    end
endmodule



// Testbench for 2x1 MUX

module tb;
  reg i0,i1,s;
  wire y;
  
  mux_2to1 dut(i0,i1,s,y);
  initial
    begin
      for(int i=0; i<8; i+=1)
        begin
          {s,i1,i0}=i;
          #2;
        end
    end
  initial
    begin
      $monitor("sim time=%0t ns, s=%b, i0=%b, i1=%b, y=%b",$time,s,i0,i1,y);
    end
endmodule

