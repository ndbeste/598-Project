module conv1_engine
(
input logic clk,
input logic begin_conv,
output logic done_conv,
input logic image[0:27][0:27],
input logic kernels[0:18-1][0:5-1][0:5-1][0:5-1],
input logic [7-1:0] offset [0:18-1],
output logic out_fmap[0:11][0:11][0:18-1]
);

logic image_section[0:5][0:5];
logic active_convolution;

logic [3:0] row_cnt;
logic [3:0] col_cnt;

logic pixel_array [0:18-1];

always_ff @(posedge clk) begin
if (begin_conv) begin
active_convolution <= 1'b1;
end
else if (col_cnt == 4'd11 && row_cnt == 4'd11) begin
active_convolution <= 1'b0;
end
else begin
active_convolution <= active_convolution;
end
end



always_ff @(posedge clk) begin
if (begin_conv) begin
col_cnt <= 5'd0;
end
else if (col_cnt != 4'd11 && active_convolution) begin
col_cnt <= col_cnt + 1'b1;
end
else begin
col_cnt <= 5'd0;
end
end


always @(posedge clk)
if (begin_conv) begin
row_cnt <= 5'd0;
end
else if (col_cnt == 4'd11 && active_convolution && row_cnt!= 4'd11) begin
row_cnt <= row_cnt + 1'b1;
end
else begin
row_cnt <= row_cnt;
end

always_ff @(posedge clk) begin
done_conv <= (row_cnt == 4'd11) && (col_cnt == 4'd11);
end

genvar x, y;
generate
for (x = 0; x < 6; x++) begin
for (y = 0; y < 6; y++) begin
assign image_section[x][y] = image[(row_cnt<<1)+x][(col_cnt<<1)+y];
end
end
endgenerate

/*
assign image_section[0][0] = image[row_cnt<<1][col_cnt<<1];
assign image_section[0][1] = image[row_cnt<<1][(col_cnt<<1)+1'b1];
assign image_section[0][2] = image[row_cnt<<1][(col_cnt<<1)+2'd2];
assign image_section[0][3] = image[row_cnt<<1][(col_cnt<<1)+2'd3];
assign image_section[0][4] = image[row_cnt<<1][(col_cnt<<1)+3'd4];
assign image_section[0][5] = image[row_cnt<<1][(col_cnt<<1)+3'd5];

assign image_section[1][0] = image[(row_cnt<<1)+1'b1][col_cnt<<1];
assign image_section[1][1] = image[(row_cnt<<1)+1'b1][(col_cnt<<1)+1'b1];
assign image_section[1][2] = image[(row_cnt<<1)+1'b1][(col_cnt<<1)+2'd2];
assign image_section[1][3] = image[(row_cnt<<1)+1'b1][(col_cnt<<1)+2'd3];
assign image_section[1][4] = image[(row_cnt<<1)+1'b1][(col_cnt<<1)+3'd4];
assign image_section[1][5] = image[(row_cnt<<1)+1'b1][(col_cnt<<1)+3'd5];

assign image_section[2][0] = image[(row_cnt<<1)+2'd2][col_cnt<<1];
assign image_section[2][1] = image[(row_cnt<<1)+2'd2][(col_cnt<<1)+1'b1];
assign image_section[2][2] = image[(row_cnt<<1)+2'd2][(col_cnt<<1)+2'd2];
assign image_section[2][3] = image[(row_cnt<<1)+2'd2][(col_cnt<<1)+2'd3];
assign image_section[2][4] = image[(row_cnt<<1)+2'd2][(col_cnt<<1)+3'd4];
assign image_section[2][5] = image[(row_cnt<<1)+2'd2][(col_cnt<<1)+3'd5];

assign image_section[3][0] = image[(row_cnt<<1)+2'd3][col_cnt<<1];
assign image_section[3][1] = image[(row_cnt<<1)+2'd3][(col_cnt<<1)+1'b1];
assign image_section[3][2] = image[(row_cnt<<1)+2'd3][(col_cnt<<1)+2'd2];
assign image_section[3][3] = image[(row_cnt<<1)+2'd3][(col_cnt<<1)+2'd3];
assign image_section[3][4] = image[(row_cnt<<1)+2'd3][(col_cnt<<1)+3'd4];
assign image_section[3][5] = image[(row_cnt<<1)+2'd3][(col_cnt<<1)+3'd5];

assign image_section[4][0] = image[(row_cnt<<1)+3'd4][col_cnt<<1];
assign image_section[4][1] = image[(row_cnt<<1)+3'd4][(col_cnt<<1)+1'b1];
assign image_section[4][2] = image[(row_cnt<<1)+3'd4][(col_cnt<<1)+2'd2];
assign image_section[4][3] = image[(row_cnt<<1)+3'd4][(col_cnt<<1)+2'd3];
assign image_section[4][4] = image[(row_cnt<<1)+3'd4][(col_cnt<<1)+3'd4];
assign image_section[4][5] = image[(row_cnt<<1)+3'd4][(col_cnt<<1)+3'd5];

assign image_section[5][0] = image[(row_cnt<<1)+3'd5][col_cnt<<1];
assign image_section[5][1] = image[(row_cnt<<1)+3'd5][(col_cnt<<1)+1'b1];
assign image_section[5][2] = image[(row_cnt<<1)+3'd5][(col_cnt<<1)+2'd2];
assign image_section[5][3] = image[(row_cnt<<1)+3'd5][(col_cnt<<1)+2'd3];
assign image_section[5][4] = image[(row_cnt<<1)+3'd5][(col_cnt<<1)+3'd4];
assign image_section[5][5] = image[(row_cnt<<1)+3'd5][(col_cnt<<1)+3'd5];
*/


conv_pool_channels conv (.kernels, .offset, .image(image_section), .pixel(pixel_array));


// Array memory below

always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap[row_cnt][col_cnt] <= pixel_array ;




endmodule
