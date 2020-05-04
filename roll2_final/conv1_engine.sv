module conv1_engine
(
input logic clk,
input logic rst_n,
input logic begin_conv,
output logic done_conv,
input logic image[0:28*28-1],
input logic kernels[0:18*5*5*5-1],
input logic [7-1:0] offset [0:18-1],
output logic out_fmap[0:12*12*18-1]
);

logic image_section[0:6*6-1];
logic active_convolution, next_active_convolution;

logic [3:0] row_cnt, next_row_cnt;
logic [3:0] col_cnt, next_col_cnt;

logic pixel_array [0:18-1];

always_comb begin
  priority case (1'b1)
    begin_conv : next_active_convolution = 1'b1;
    (col_cnt == 4'd11 && row_cnt == 4'd11) : next_active_convolution = 1'b0;
    default : next_active_convolution = active_convolution;
  endcase
end

always_ff @(posedge clk) begin
  priority case (1'b1)
    (~rst_n) : active_convolution <= 2'd0;
    default  : active_convolution <= next_active_convolution;
 endcase
end

always_comb begin
  priority case (1'b1)
    begin_conv ||  (col_cnt == 4'd11)    : next_col_cnt = 4'd0;
    active_convolution : next_col_cnt = col_cnt + 1'b1;
    default : next_col_cnt = col_cnt;
  endcase
end

always_comb begin
  priority case (1'b1)
    begin_conv         : next_row_cnt = 4'd0;
    (col_cnt == 4'd11) : next_row_cnt = row_cnt + 1'b1;
    default : next_row_cnt = row_cnt;
  endcase
end


always_ff @(posedge clk) begin
  priority case (1'b1)
    (~rst_n) : col_cnt <= 4'd0;
    default  : col_cnt <= next_col_cnt;
 endcase
end


always_ff @(posedge clk) begin
  priority case (1'b1)
    (~rst_n) : row_cnt <= 4'd0;
    default  : row_cnt <= next_row_cnt;
 endcase
end

logic next_done;

always_comb begin
  priority case (1'b1)
    (col_cnt == 4'd11 && row_cnt == 4'd11) : next_done = 1'b1;
    default : next_done = 1'b0;
  endcase
end

always_ff @(posedge clk) begin
  priority case (1'b1)
    (~rst_n) : done_conv <= 1'b0;
    default  : done_conv <= next_done;
 endcase
end



genvar x, y;
generate
for (x = 0; x < 6; x++) begin
for (y = 0; y < 6; y++) begin
assign image_section[x*6+y] = image[((row_cnt<<1)+x)*28+(col_cnt<<1)+y];
end
end
endgenerate



conv_pool_channels conv (.kernels, .offset, .image(image_section), .pixel(pixel_array));


// Array memory below

logic out_fmap0 [0:12*12-1];
logic out_fmap1 [0:12*12-1];
logic out_fmap2 [0:12*12-1];
logic out_fmap3 [0:12*12-1];
logic out_fmap4 [0:12*12-1];
logic out_fmap5 [0:12*12-1];
logic out_fmap6 [0:12*12-1];
logic out_fmap7 [0:12*12-1];
logic out_fmap8 [0:12*12-1];
logic out_fmap9 [0:12*12-1];
logic out_fmap10 [0:12*12-1];
logic out_fmap11 [0:12*12-1];
logic out_fmap12 [0:12*12-1];
logic out_fmap13 [0:12*12-1];
logic out_fmap14 [0:12*12-1];
logic out_fmap15 [0:12*12-1];
logic out_fmap16 [0:12*12-1];
logic out_fmap17 [0:12*12-1];

genvar i;


always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap0[row_cnt*12+col_cnt] <= pixel_array[0] ;

always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap1[row_cnt*12+col_cnt] <= pixel_array[1] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap2[row_cnt*12+col_cnt] <= pixel_array[2] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap3[row_cnt*12+col_cnt] <= pixel_array[3] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap4[row_cnt*12+col_cnt] <= pixel_array[4] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap5[row_cnt*12+col_cnt] <= pixel_array[5] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap6[row_cnt*12+col_cnt] <= pixel_array[6] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap7[row_cnt*12+col_cnt] <= pixel_array[7] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap8[row_cnt*12+col_cnt] <= pixel_array[8] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap9[row_cnt*12+col_cnt] <= pixel_array[9] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap10[row_cnt*12+col_cnt] <= pixel_array[10] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap11[row_cnt*12+col_cnt] <= pixel_array[11] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap12[row_cnt*12+col_cnt] <= pixel_array[12] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap13[row_cnt*12+col_cnt] <= pixel_array[13] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap14[row_cnt*12+col_cnt] <= pixel_array[14] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap15[row_cnt*12+col_cnt] <= pixel_array[15] ;
always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap16[row_cnt*12+col_cnt] <= pixel_array[16] ;

always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap17[row_cnt*12+col_cnt] <= pixel_array[17] ;



assign out_fmap[0:12*12-1] = out_fmap0;
assign out_fmap[1*12*12:2*12*12-1] = out_fmap1;
assign out_fmap[2*12*12:3*12*12-1] = out_fmap2;
assign out_fmap[3*12*12:4*12*12-1] = out_fmap3;
assign out_fmap[4*12*12:5*12*12-1] = out_fmap4;
assign out_fmap[5*12*12:6*12*12-1] = out_fmap5;
assign out_fmap[6*12*12:7*12*12-1] = out_fmap6;
assign out_fmap[7*12*12:8*12*12-1] = out_fmap7;
assign out_fmap[8*12*12:9*12*12-1] = out_fmap8;
assign out_fmap[9*12*12:10*12*12-1] = out_fmap9;
assign out_fmap[10*12*12:11*12*12-1] = out_fmap10;
assign out_fmap[11*12*12:12*12*12-1] = out_fmap11;
assign out_fmap[12*12*12:13*12*12-1] = out_fmap12;
assign out_fmap[13*12*12:14*12*12-1] = out_fmap13;
assign out_fmap[14*12*12:15*12*12-1] = out_fmap14;
assign out_fmap[15*12*12:16*12*12-1] = out_fmap15;
assign out_fmap[16*12*12:17*12*12-1] = out_fmap16;
assign out_fmap[17*12*12:18*12*12-1] = out_fmap17;





endmodule
