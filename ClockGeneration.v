//Clock generation

module tb;
  reg clk;
  initial
    begin
      clk=0;
      #50 $finish;
    end
  always
    #5 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk);
  end
endmodule
    

//clock generation with 80% duty cycle

module tb;
  reg clk;
  initial
    begin
      clk=0;
      #50 $finish;
    end

  always
    begin
      #2 clk = 1;
      #8 clk = 0;
    end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk);
  end
endmodule
