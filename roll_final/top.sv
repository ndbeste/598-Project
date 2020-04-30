module top

(
  input logic     clk,
  input logic     rst_n,
  output logic    image_in_ready,
  input logic     image_in_valid,
  input logic     image [0:27][0:27],
  //input logic     kernel_in_valid,
  //input logic     offset_in_valid,
  input logic [1 : 0] kernel_layer,  // 0=invalid, 1=conv1, 2-conv2, 3=fc
  input logic [1 : 0] offset_layer,  // 0=invalid, 1=conv1, 2-conv2, 3=fc
  output logic [3:0] class_out,
  input logic     class_out_ready,
  output logic    class_out_valid

);
  logic image_mem [0:27][0:27];
  always_ff @ (posedge clk) begin
    image_mem <= image;
  end
  logic image_ready;
  always_ff @ (posedge clk) begin
    image_ready <= image_in_valid;
  end

  logic kernel_input [0:4][0:4];
  assign kernel_input[0] = image[0][0:4];
  assign kernel_input[1] = image[0][5:9];
  assign kernel_input[2] = image[0][10:14];
  assign kernel_input[3] = image[0][15:19];
  assign kernel_input[4] = image[0][20:24];

  logic [8:0] number_input;
  assign number_input = {image[3][0],image[3][1],image[3][2],image[3][3],image[3][4],image[3][5],image[3][6],image[3][7],image[3][8]};

  logic kernel_mem1 [0:18-1][0:5-1][0:5-1][0:5-1];
  logic kernel_mem2 [0:60-1][0:18-1][0:5-1][0:5-1];
  logic [8-1   :0] mult_weights_fc [0:9];
  logic [60*4*4-1   :0] bin_weights_fc [0:9];
  logic [7-1:0] offset_mem1 [0:18-1];
  logic [9-1:0] offset_mem2 [0:60-1];

  logic [0:4] kmem_addr18;
  logic [0:2] kmem_addr5;
  logic [0:3] kmem_addr10;
  logic [0:5] kmem_addr60;
  logic [0:9] kmem_addr960;
  assign kmem_addr18 = {image[1][0], image[1][1], image[1][2], image[1][3], image[1][4]};
  assign kmem_addr5 = {image[1][0], image[1][1], image[1][2]};
  assign kmem_addr10 = {image[1][0], image[1][1], image[1][2], image[1][3]};
  assign kmem_addr60 = {image[1][0], image[1][1], image[1][2], image[1][3], image[1][4], image[1][5]};
  assign kmem_addr960 = {image[1][0], image[1][1], image[1][2], image[1][3], image[1][4], image[1][5], image[1][6], image[1][7], image[1][8], image[1][9]};

  always @(posedge clk)
     if( kernel_layer == 2'd1 ) //conv1
       kernel_mem1[kmem_addr18][kmem_addr5] <= kernel_input ;

  always @(posedge clk)
     if( kernel_layer == 2'd2 ) //conv2
       kernel_mem2[kmem_addr60][kmem_addr18] <= kernel_input ;

  always @(posedge clk)
     if( kernel_layer == 2'd2 ) //fc
       bin_weights_fc[kmem_addr10][kmem_addr960] <= number_input[0] ;

  always @(posedge clk)
     if( offset_layer == 2'd1 ) //conv1 bias
       offset_mem1[kmem_addr18] <= number_input[6:0] ;

  always @(posedge clk)
     if( offset_layer == 2'd2 ) //conv2 bias
       offset_mem2[kmem_addr60] <= number_input ;

  always @(posedge clk)
     if( offset_layer == 2'd3 ) //fc_mult
       mult_weights_fc[kmem_addr10] <= number_input[7:0] ;

  logic conv1_complete;
  logic conv2_complete;
  logic fc_complete;
  logic conv1_out[0:11][0:11][0:18-1];
  logic conv2_out[0:3][0:3][0:60-1];
  logic [4*4*60-1:0]conv2_flatten;
  logic [16:0] fc_out [0:9];

  conv1_engine c1 (.clk, .image(image_mem), .begin_conv(image_ready), .done_conv(conv1_complete), .kernels(kernel_mem1), .offset(offset_mem1), .out_fmap(conv1_out));

  conv2_engine c2 (.clk, .image(conv1_out), .begin_conv(conv1_complete), .done_conv(conv2_complete), .kernels(kernel_mem2), .offset(offset_mem2), .out_fmap(conv2_out));

  genvar x, y, z;

  generate
  for(x = 0; x<4; x++) begin
   for(y = 0; y<4; y++) begin
    for(z = 0; z<60; z++) begin
     assign conv2_flatten[z*4*4+y*4+x] = conv2_out[x][y][z];
    end
   end
  end
  endgenerate

  fully_connected fc (.clk, .rst_n, .fc_valid(conv2_complete), .sum_valid(fc_complete), .fan_in(conv2_flatten), .weights(mult_weights_fc), .binary_weights(bin_weights_fc), .fan_out(fc_out));

  fastest_argmax10 arg ( .clk, .rst_n, .arg_out_valid(class_out_valid), .arg_in_valid(fc_complete), .bids(fc_out), .win_out(class_out));

endmodule
