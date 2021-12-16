module test;
  reg clk;
  reg [1:0] data;
  wire out1, out2;

  island CATALINA(.clk(clk), .data_in(data), .out1(out1), .out2(out2));

  initial begin
    $dumpfile("dump2.vcd"); 
    $dumpvars;
    
    
    clk = 0;
    data = 2'b11;
    clk_step; clk_step;

    data = 2'b00;
    clk_step; clk_step;
    
    data = 2'b01;
    clk_step; clk_step;
    
    data = 2'b10;
    clk_step; clk_step;
    
    data = 2'b00;
    clk_step; clk_step;
    

  end

  task clk_step;
    begin
      #1 clk = ~clk;
      #1 clk = ~clk;
    end
  endtask

endmodule
