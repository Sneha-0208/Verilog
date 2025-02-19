//DUT for 3x8 Decoder using continuous assignment

module decoder3to8(a,y);
  input [2:0] a;
  output [7:0] y;
  assign y = 1<<a;
endmodule

//Testbench

module tb;
  reg [2:0] a;
  wire [7:0] y;
  
  decoder3to8 dut(a,y);
    initial
      begin
        for(integer i = 0; i < 8; i+=1)
          begin
          a = i;
          #2;
          end
      end
  initial
    begin
      $monitor("a=%b | y=%b",a,y);
    end
endmodule
