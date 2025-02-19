//Generalised mod-counter (use of $clog2)

module counter_mod_N(clk,rst,count);
  parameter N=10;
  input clk,rst;
  output [$clog2(N)-1:0] count;
  reg [$clog2(N)-1:0] temp;
  
  assign count=temp;
  
  always@(posedge clk)

    begin
     if(rst)
        temp<=0;
      else
        if(temp==N-1)
          temp<=0;
        else
          temp=temp+1;

    end
endmodule


module tb;
  parameter N=10;
  reg clk,rst;
  wire [$clog2(N)-1:0] count;
  
  counter_mod_N dut(clk,rst,count);
  
  initial
    begin
      
      clk=0;
      rst=1;
      #8rst=0;
      #100$finish;
    end
  
  always
    #2clk=~clk;
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,clk,rst,count);
    end
endmodule



// To change the mod N value anytime

module tb;
  defparam dut.N=5;		//used defparam keyword to change N
  reg clk,rst;
  wire [$clog2(dut.N)-1:0] count;
  
  counter_mod_N dut(clk,rst,count);
  
  initial
    begin
      
      clk=0;
      rst=1;
      #8rst=0;
      #100$finish;
    end
  
  always
    #2clk=~clk;
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,clk,rst,count);
    end
endmodule

