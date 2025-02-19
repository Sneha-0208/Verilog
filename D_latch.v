// D Latch with Asynchronous Reset

module d_latch(d, clk,rst,q);
  input d,clk,rst;
  output reg q;
  always @(d,clk,rst)
   begin
     // Async- Priority will be given to reset
     if(rst)
       q <= 0; // Use nonblocking assignment in all seq. circuits
     else
       if(clk)
         q <= d;
   end
endmodule


// D Latch with Synchronous Reset

module d_latch(d, clk,rst,q);
  input d,clk,rst;
  output reg q;
  always @(d,clk,rst)
   begin
     // sync- Priority will be given to clk
     if(clk)
       if(rst)
         q <= 0;
        else
       	 q <= d;
   end
endmodule

// Testbench for D latch and flip flop

module tb;
  reg d,clk,rst;
  wire q;
  
  d_latch dut(d,clk,rst,q);
  
  initial
    begin
    clk=0;
  d=0;
  rst=0;
  #1rst=1;
  #2d=1;
  #4rst=0;
  #4d=0;
  #8d=1;
  #7d=0;
  
  #5 $finish;
  end
  
  always
    #2clk=~clk;
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,clk,d,rst,q);
    end
endmodule

