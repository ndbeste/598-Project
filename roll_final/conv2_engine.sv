module conv2_engine
(
input logic clk,
input logic begin_conv,
output logic done_conv,
input logic image[0:11][0:11][0:18-1], //18 is out of order due to conv1_engine, but is fixed inisde module
input logic kernels[0:60-1][0:18-1][0:5-1][0:5-1],
input logic [9-1:0] offset [0:60-1],
output logic out_fmap[0:3][0:3][0:60-1]
);

logic image_section[0:18-1][0:5][0:5];
logic active_convolution;

logic [1:0] row_cnt;
logic [1:0] col_cnt;

logic pixel_array [0:60-1];

always_ff @(posedge clk) begin
  if (begin_conv) begin
    active_convolution <= 1'b1;
  end else if (col_cnt == 2'd3 && row_cnt == 2'd3) begin
    active_convolution <= 1'b0;
  end else begin
    active_convolution <= active_convolution;
  end
end



always_ff @(posedge clk) begin
  if (begin_conv) begin
    col_cnt <= 2'd0;
  end else if (col_cnt != 2'd3 && active_convolution) begin
    col_cnt <= col_cnt + 1'b1;
  end else begin
    col_cnt <= 2'd0;
  end
end


always_ff @(posedge clk)
  if (begin_conv) begin
    row_cnt <= 5'd0;
  end else if (col_cnt == 2'd3 && active_convolution && row_cnt!= 2'd3) begin
    row_cnt <= row_cnt + 1'b1;
  end else begin
    row_cnt <= row_cnt;
end

always_ff @(posedge clk) begin
  done_conv <= (row_cnt == 2'd3) && (col_cnt == 2'd3);
end

genvar x, y, z;
generate
 for (z = 0; z < 18; z++) begin
  for (x = 0; x < 6; x++) begin
   for (y = 0; y < 6; y++) begin
    assign image_section[z][x][y] = image[(row_cnt<<1)+x][(col_cnt<<1)+y][z]; //switch order of zth axis
   end
  end
 end
endgenerate



conv_pool_channels2 conv (.kernels, .offset, .image(image_section), .pixel(pixel_array));


// Array memory below

always @(posedge clk)
     if( active_convolution ) //Only write if actively convolving
       out_fmap[row_cnt][col_cnt] <= pixel_array ;




endmodule
