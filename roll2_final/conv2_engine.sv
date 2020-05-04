module conv2_engine
(
input logic clk,
input logic rst_n,
input logic begin_conv,
output logic done_conv,
input logic image[0:12*12*18-1], //18 is out of order due to conv1_engine, but is fixed inisde module
input logic kernels[0:60*18*5*5-1],
input logic [9-1:0] offset [0:60-1],
output logic out_fmap[0:4*4*60-1]
);

logic image_section[0:18*6*6-1];
logic active_convolution, next_active_convolution;

logic [1:0] row_cnt, next_row_cnt;
logic [1:0] col_cnt, next_col_cnt;
logic [3:0] channel_cnt, next_channel_cnt;


logic pixel_array [0:6-1];


always_comb begin
  priority case (1'b1)
    begin_conv : next_active_convolution = 1'b1;
    (col_cnt == 2'd3 && row_cnt == 2'd3 && channel_cnt == 4'd9) : next_active_convolution = 1'b0;
    default : next_active_convolution = active_convolution;
  endcase
end



always_comb begin
  priority case (1'b1)
    begin_conv || (channel_cnt == 4'd9 && col_cnt == 2'd3) : next_col_cnt = 2'd0;
    (channel_cnt == 4'd9) 				   : next_col_cnt = col_cnt + 1'b1;
    default                                                : next_col_cnt = col_cnt;
  endcase
end

always_comb begin
  priority case (1'b1)
    begin_conv                               : next_row_cnt = 2'd0;
    (channel_cnt == 4'd9 && col_cnt == 2'd3) : next_row_cnt = row_cnt + 1'b1;
    default                                  : next_row_cnt = row_cnt;
  endcase
end


always_comb begin
  priority case (1'b1)
    begin_conv ||  (channel_cnt == 4'd9)    : next_channel_cnt = 4'd0;
    active_convolution : next_channel_cnt = channel_cnt + 1'b1;
    default : next_channel_cnt = channel_cnt;
  endcase
end


always_ff @(posedge clk) begin
  priority case (1'b1)
    (~rst_n) : active_convolution <= 2'd0;
    default  : active_convolution <= next_active_convolution;
 endcase
end


always_ff @(posedge clk) begin
  priority case (1'b1)
    (~rst_n) : col_cnt <= 2'd0;
    default  : col_cnt <= next_col_cnt;
 endcase
end



always_ff @(posedge clk) begin
  priority case (1'b1)
    (~rst_n) : row_cnt <= 2'd0;
    default  : row_cnt <= next_row_cnt;
 endcase
end

always_ff @(posedge clk) begin
  priority case (1'b1)
    (~rst_n) : channel_cnt <= 4'd0;
    default  : channel_cnt <= next_channel_cnt;
 endcase
end

logic next_done;

always_comb begin
  priority case (1'b1)
    (col_cnt == 2'd3 && row_cnt == 2'd3 && channel_cnt == 4'd9) : next_done = 1'b1;
    default : next_done = 1'b0;
  endcase
end

always_ff @(posedge clk) begin
  priority case (1'b1)
    (~rst_n) : done_conv <= 1'b0;
    default  : done_conv <= next_done;
 endcase
end

genvar x, y, z;
generate
 for (z = 0; z < 18; z++) begin
  for (x = 0; x < 6; x++) begin
   for (y = 0; y < 6; y++) begin
    assign image_section[z*6*6+x*6+y] = image[z*12*12+((row_cnt<<1)+x)*12+((col_cnt<<1)+y)]; //switch order of zth axis
   end
  end
 end
endgenerate


logic kernel_array[0:60-1][0:18*5*5-1];

generate
 for (y = 0; y < 60; y++) begin
    assign kernel_array[y] = kernels[y*18*5*5:(y+1)*18*5*5-1]; //switch order of zth axis
 end
endgenerate


conv_pool_pixel450 c0 (.image(image_section), .kernels(kernel_array[channel_cnt*6]),      .offset(offset[channel_cnt*6]),      .pixel(pixel_array[0]));
conv_pool_pixel450 c1 (.image(image_section), .kernels(kernel_array[channel_cnt*6+1'b1]), .offset(offset[channel_cnt*6+1'b1]), .pixel(pixel_array[1]));
conv_pool_pixel450 c2 (.image(image_section), .kernels(kernel_array[channel_cnt*6+2'd2]), .offset(offset[channel_cnt*6+2'd2]), .pixel(pixel_array[2]));
conv_pool_pixel450 c3 (.image(image_section), .kernels(kernel_array[channel_cnt*6+2'd3]), .offset(offset[channel_cnt*6+2'd3]), .pixel(pixel_array[3]));
conv_pool_pixel450 c4 (.image(image_section), .kernels(kernel_array[channel_cnt*6+3'd4]), .offset(offset[channel_cnt*6+3'd4]), .pixel(pixel_array[4]));
conv_pool_pixel450 c5 (.image(image_section), .kernels(kernel_array[channel_cnt*6+3'd5]), .offset(offset[channel_cnt*6+3'd5]), .pixel(pixel_array[5]));

//conv_pool_channels2 conv (.kernels, .offset, .image(image_section), .pixel(pixel_array));


// Array memory below
logic out_fmap0[0:4*4-1];
logic out_fmap1[0:4*4-1];
logic out_fmap2[0:4*4-1];
logic out_fmap3[0:4*4-1];
logic out_fmap4[0:4*4-1];
logic out_fmap5[0:4*4-1];
logic out_fmap6[0:4*4-1];
logic out_fmap7[0:4*4-1];
logic out_fmap8[0:4*4-1];
logic out_fmap9[0:4*4-1];
logic out_fmap10[0:4*4-1];
logic out_fmap11[0:4*4-1];
logic out_fmap12[0:4*4-1];
logic out_fmap13[0:4*4-1];
logic out_fmap14[0:4*4-1];
logic out_fmap15[0:4*4-1];
logic out_fmap16[0:4*4-1];
logic out_fmap17[0:4*4-1];
logic out_fmap18[0:4*4-1];
logic out_fmap19[0:4*4-1];
logic out_fmap20[0:4*4-1];
logic out_fmap21[0:4*4-1];
logic out_fmap22[0:4*4-1];
logic out_fmap23[0:4*4-1];
logic out_fmap24[0:4*4-1];
logic out_fmap25[0:4*4-1];
logic out_fmap26[0:4*4-1];
logic out_fmap27[0:4*4-1];
logic out_fmap28[0:4*4-1];
logic out_fmap29[0:4*4-1];
logic out_fmap30[0:4*4-1];
logic out_fmap31[0:4*4-1];
logic out_fmap32[0:4*4-1];
logic out_fmap33[0:4*4-1];
logic out_fmap34[0:4*4-1];
logic out_fmap35[0:4*4-1];
logic out_fmap36[0:4*4-1];
logic out_fmap37[0:4*4-1];
logic out_fmap38[0:4*4-1];
logic out_fmap39[0:4*4-1];
logic out_fmap40[0:4*4-1];
logic out_fmap41[0:4*4-1];
logic out_fmap42[0:4*4-1];
logic out_fmap43[0:4*4-1];
logic out_fmap44[0:4*4-1];
logic out_fmap45[0:4*4-1];
logic out_fmap46[0:4*4-1];
logic out_fmap47[0:4*4-1];
logic out_fmap48[0:4*4-1];
logic out_fmap49[0:4*4-1];
logic out_fmap50[0:4*4-1];
logic out_fmap51[0:4*4-1];
logic out_fmap52[0:4*4-1];
logic out_fmap53[0:4*4-1];
logic out_fmap54[0:4*4-1];
logic out_fmap55[0:4*4-1];
logic out_fmap56[0:4*4-1];
logic out_fmap57[0:4*4-1];
logic out_fmap58[0:4*4-1];
logic out_fmap59[0:4*4-1];


always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd0) )
		out_fmap0[{row_cnt,col_cnt}] <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd0) ) 
		out_fmap1[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd0) ) 
		out_fmap2[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd0) ) 
		out_fmap3[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd0) ) 
		out_fmap4[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd0) ) 
		out_fmap5[{row_cnt,col_cnt}] <= pixel_array[5];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd1) ) 
		out_fmap6[{row_cnt,col_cnt}] <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd1)) 
		out_fmap7[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd1)) 
		out_fmap8[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd1)) 
		out_fmap9[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd1)) 
		out_fmap10[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd1)) 
		out_fmap11[{row_cnt,col_cnt}] <= pixel_array[5];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd2)) 
		out_fmap12[{row_cnt,col_cnt}] <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd2)) 
		out_fmap13[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd2)) 
		out_fmap14[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd2)) 
		out_fmap15[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd2)) 
		out_fmap16[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd2)) 
		out_fmap17[{row_cnt,col_cnt}] <= pixel_array[5];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd3)) 
		out_fmap18[{row_cnt,col_cnt}] <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd3)) 
		out_fmap19[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd3)) 
		out_fmap20[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd3)) 
		out_fmap21[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd3)) 
		out_fmap22[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd3)) 
		out_fmap23[{row_cnt,col_cnt}] <= pixel_array[5];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd4)) 
		out_fmap24[{row_cnt,col_cnt}]  <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd4)) 
		out_fmap25[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd4)) 
		out_fmap26[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd4)) 
		out_fmap27[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd4)) 
		out_fmap28[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd4)) 
		out_fmap29[{row_cnt,col_cnt}] <= pixel_array[5];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd5)) 
		out_fmap30[{row_cnt,col_cnt}] <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd5)) 
		out_fmap31[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd5)) 
		out_fmap32[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd5)) 
		out_fmap33[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd5)) 
		out_fmap34[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd5)) 
		out_fmap35[{row_cnt,col_cnt}] <= pixel_array[5];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd6)) 
		out_fmap36[{row_cnt,col_cnt}] <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd6)) 
		out_fmap37[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd6)) 
		out_fmap38[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd6)) 
		out_fmap39[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd6)) 
		out_fmap40[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd6)) 
		out_fmap41[{row_cnt,col_cnt}] <= pixel_array[5];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd7)) 
		out_fmap42[{row_cnt,col_cnt}] <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd7)) 
		out_fmap43[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd7)) 
		out_fmap44[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd7)) 
		out_fmap45[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd7)) 
		out_fmap46[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd7)) 
		out_fmap47[{row_cnt,col_cnt}] <= pixel_array[5];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd8)) 
		out_fmap48[{row_cnt,col_cnt}] <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd8)) 
		out_fmap49[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd8)) 
		out_fmap50[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd8)) 
		out_fmap51[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd8)) 
		out_fmap52[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd8)) 
		out_fmap53[{row_cnt,col_cnt}] <= pixel_array[5];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd9)) 
		out_fmap54[{row_cnt,col_cnt}] <= pixel_array[0];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd9)) 
		out_fmap55[{row_cnt,col_cnt}] <= pixel_array[1];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd9)) 
		out_fmap56[{row_cnt,col_cnt}] <= pixel_array[2];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd9)) 
		out_fmap57[{row_cnt,col_cnt}] <= pixel_array[3];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd9)) 
		out_fmap58[{row_cnt,col_cnt}] <= pixel_array[4];
always @(posedge clk)
	if( active_convolution && (channel_cnt == 4'd9)) 
		out_fmap59[{row_cnt,col_cnt}] <= pixel_array[5];
       
assign out_fmap[0*4*4:1*4*4-1] = out_fmap0; 
assign out_fmap[1*4*4:2*4*4-1] = out_fmap1; 
assign out_fmap[2*4*4:3*4*4-1] = out_fmap2; 
assign out_fmap[3*4*4:4*4*4-1] = out_fmap3; 
assign out_fmap[4*4*4:5*4*4-1] = out_fmap4; 
assign out_fmap[5*4*4:6*4*4-1] = out_fmap5; 
assign out_fmap[6*4*4:7*4*4-1] = out_fmap6; 
assign out_fmap[7*4*4:8*4*4-1] = out_fmap7; 
assign out_fmap[8*4*4:9*4*4-1] = out_fmap8; 
assign out_fmap[9*4*4:10*4*4-1] = out_fmap9; 
assign out_fmap[10*4*4:11*4*4-1] = out_fmap10; 
assign out_fmap[11*4*4:12*4*4-1] = out_fmap11; 
assign out_fmap[12*4*4:13*4*4-1] = out_fmap12; 
assign out_fmap[13*4*4:14*4*4-1] = out_fmap13; 
assign out_fmap[14*4*4:15*4*4-1] = out_fmap14; 
assign out_fmap[15*4*4:16*4*4-1] = out_fmap15; 
assign out_fmap[16*4*4:17*4*4-1] = out_fmap16; 
assign out_fmap[17*4*4:18*4*4-1] = out_fmap17; 
assign out_fmap[18*4*4:19*4*4-1] = out_fmap18; 
assign out_fmap[19*4*4:20*4*4-1] = out_fmap19; 
assign out_fmap[20*4*4:21*4*4-1] = out_fmap20; 
assign out_fmap[21*4*4:22*4*4-1] = out_fmap21; 
assign out_fmap[22*4*4:23*4*4-1] = out_fmap22; 
assign out_fmap[23*4*4:24*4*4-1] = out_fmap23; 
assign out_fmap[24*4*4:25*4*4-1] = out_fmap24; 
assign out_fmap[25*4*4:26*4*4-1] = out_fmap25; 
assign out_fmap[26*4*4:27*4*4-1] = out_fmap26; 
assign out_fmap[27*4*4:28*4*4-1] = out_fmap27; 
assign out_fmap[28*4*4:29*4*4-1] = out_fmap28; 
assign out_fmap[29*4*4:30*4*4-1] = out_fmap29; 
assign out_fmap[30*4*4:31*4*4-1] = out_fmap30; 
assign out_fmap[31*4*4:32*4*4-1] = out_fmap31; 
assign out_fmap[32*4*4:33*4*4-1] = out_fmap32; 
assign out_fmap[33*4*4:34*4*4-1] = out_fmap33; 
assign out_fmap[34*4*4:35*4*4-1] = out_fmap34; 
assign out_fmap[35*4*4:36*4*4-1] = out_fmap35; 
assign out_fmap[36*4*4:37*4*4-1] = out_fmap36; 
assign out_fmap[37*4*4:38*4*4-1] = out_fmap37; 
assign out_fmap[38*4*4:39*4*4-1] = out_fmap38; 
assign out_fmap[39*4*4:40*4*4-1] = out_fmap39; 
assign out_fmap[40*4*4:41*4*4-1] = out_fmap40; 
assign out_fmap[41*4*4:42*4*4-1] = out_fmap41; 
assign out_fmap[42*4*4:43*4*4-1] = out_fmap42; 
assign out_fmap[43*4*4:44*4*4-1] = out_fmap43; 
assign out_fmap[44*4*4:45*4*4-1] = out_fmap44; 
assign out_fmap[45*4*4:46*4*4-1] = out_fmap45; 
assign out_fmap[46*4*4:47*4*4-1] = out_fmap46; 
assign out_fmap[47*4*4:48*4*4-1] = out_fmap47; 
assign out_fmap[48*4*4:49*4*4-1] = out_fmap48; 
assign out_fmap[49*4*4:50*4*4-1] = out_fmap49; 
assign out_fmap[50*4*4:51*4*4-1] = out_fmap50; 
assign out_fmap[51*4*4:52*4*4-1] = out_fmap51; 
assign out_fmap[52*4*4:53*4*4-1] = out_fmap52; 
assign out_fmap[53*4*4:54*4*4-1] = out_fmap53; 
assign out_fmap[54*4*4:55*4*4-1] = out_fmap54; 
assign out_fmap[55*4*4:56*4*4-1] = out_fmap55; 
assign out_fmap[56*4*4:57*4*4-1] = out_fmap56; 
assign out_fmap[57*4*4:58*4*4-1] = out_fmap57; 
assign out_fmap[58*4*4:59*4*4-1] = out_fmap58; 
assign out_fmap[59*4*4:60*4*4-1] = out_fmap59; 


endmodule
