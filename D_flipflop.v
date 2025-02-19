// D flip flop with Asynchronous Reset

module D_ff(d,clk,rst,q);
  input d,clk,rst;
  output reg q;
  
  always@(posedge clk or posedge rst)
    begin
        if(rst)
          q<=0;
      else
        q<=d;
    end
endmodule

// D flip flop with Synchronous Reset

module D_ff(d,clk,rst,q);
  input d,clk,rst;
  output reg q;
  
  always@(posedge clk)
    begin
        if(rst)
          q<=0;
      else
        q<=d;
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
