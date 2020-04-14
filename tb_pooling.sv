// Testbench
module tb;
//////////////////////////parmaeters////////////////////////////////////
localparam	CLK_PERIOD=10;
parameter	RUN_TIME=975000;

  reg clk_tb;
  reg rst;
  wire signed [1:0]max;
  reg  signed [1:0] a,b,c,d;
	assign a = 2'b00;
	assign b = 2'b01;
	assign c = 2'b00;
	assign d = 2'b11;
///////////////////////////clk and rst////////////////////////////////////////////////////
always 
	begin 
		#(CLK_PERIOD/2) clk_tb=~clk_tb; 
	end
task reset_dut();
  #(CLK_PERIOD/2) rst=0;
  @(posedge clk_tb);
     #(CLK_PERIOD/3)  rst=1;	
endtask

//////////////////
  maxPooling u1(a, b, c, d, max);
initial begin  
#10 $display("~~~~~~~~~~~~a:%0d", a);
#10 $display("~~~~~~~~~~~~b:%0d", b);
#10 $display("~~~~~~~~~~~~c:%0d", c);
#10 $display("~~~~~~~~~~~~d:%0d", d);             
#10 $display("~~~~~~~~~~~~max:%0d", max);

$dumpfile("pooling.vcd");
$dumpvars(0,tb);
end
endmodule
