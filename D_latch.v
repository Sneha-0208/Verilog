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
