//4 bit counter 

//DUT
module counter_4bit(clk, rst, count);
  input clk, rst;
  output [3:0] count;
  reg [3:0] temp;
  assign count = temp;
  
  always@(posedge clk) //synchronous reset
    begin
      if(rst)
        temp<=0;
      else 
        temp=temp+1;
    end
endmodule

//testbench
module tb;
  reg clk,rst;
  wire [3:0] count;
  
  counter_4bit dut(clk,rst,count);
  
  initial
    begin
      
      clk=0;
      rst=1;
      #8rst=0;
      #80$finish;
    end
  
  always
    #2clk=~clk;
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,clk,rst,count);
    end
endmodule
