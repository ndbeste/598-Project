//////////////////////////////////////////////////////////////////////
`timescale 1ps/1ps
module tb;
//////////////////////////parmaeters////////////////////////////////////
localparam	CLK_PERIOD=10;
//parameter	RUN_TIME=CLK_PERIOD*64800;
parameter	RUN_TIME=CLK_PERIOD*(10000);
//////////////////////////////tb_interface/////////////////////////////
logic	[127:0]	image_r	[65024:0];
logic	[127:0]	image_g	[65024:0];
logic	[127:0]	image_b	[65024:0];
logic	[7:0]	results_mem [65024:0];
logic	[7:0]	golden_results [65024:0];
logic	signed [71:0]	filter_r;
logic	signed [71:0]	filter_g;
logic	signed [71:0]	filter_b;
int i,j;

///////////////////////////DUT interface////////////////////////////////////////////////////
logic	[127:0]	dut_image_r;
logic	[127:0]	dut_image_g;
logic	[127:0]	dut_image_b;
logic	[(8*9)-1:0]	dut_kernel_r;
logic	[(8*9)-1:0]	dut_kernel_g;
logic	[(8*9)-1:0]	dut_kernel_b;
logic	[15:0]	dut_im_address_r;
logic	[15:0]	dut_im_address_g;
logic	[15:0]	dut_im_address_b;
logic	[15:0]	dut_res_address;
logic	[7:0]	dut_results;
logic   [7:0]   x;
logic 	dut_give_im_r,dut_give_im_g,dut_give_im_b,clk_tb,rst,dut_take_results;
//////////////////////////////////Instance of DUT///////////////////////////////////////
conv_pool dut(	.clk(clk_tb),
				.rst(rst),
				.image_4x4_r(dut_image_r),
				.image_4x4_g(dut_image_g),
				.image_4x4_b(dut_image_b),
				.kernel_r(dut_kernel_r),
				.kernel_g(dut_kernel_g),
				.kernel_b(dut_kernel_b),
				.input_re(dut_give_im_r),
				.input_addr(dut_im_address_r),
				.output_we(dut_take_results),
				.output_addr(dut_res_address),
				.y(dut_results)
				);
always 		#(CLK_PERIOD/2) clk_tb=~clk_tb; 

task reset_dut();
  #(CLK_PERIOD/2) rst=0;
  @(posedge clk_tb);
     #(CLK_PERIOD/3) rst=1;	
endtask

initial begin
clk_tb=0;
reset_dut();
#(CLK_PERIOD*50);
$display("%d",dut_results);
$finish();
end

assign x = 8'hFF;
assign dut_image_r = '1;
assign dut_image_g = '1;
assign dut_image_b = '1;
assign dut_kernel_r = {x,x,x,x,x,x,x,x,x};
assign dut_kernel_g = {x,x,x,x,x,x,x,x,x};
assign dut_kernel_b = {x,x,x,x,x,x,x,x,x};



endmodule


