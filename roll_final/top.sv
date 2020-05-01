module top

(
  input logic     clk,
  input logic     rst_n,
  output logic    image_in_ready,
  input logic     image_in_valid,
  input logic     image [0:28*28-1],
  //input logic     kernel_in_valid,
  //input logic     offset_in_valid,
  input logic [1 : 0] kernel_layer,  // 0=invalid, 1=conv1, 2-conv2, 3=fc
  input logic [1 : 0] offset_layer,  // 0=invalid, 1=conv1, 2-conv2, 3=fc
  output logic [3:0] class_out,
  input logic     class_out_ready,
  output logic    class_out_valid

);
  logic image_mem [0:28*28-1];
  always_ff @ (posedge clk) begin
    image_mem <= image;
  end
  logic image_ready;
  always_ff @ (posedge clk) begin
    image_ready <= image_in_valid;
  end

  logic [0:5*5-1] kernel_input ;
  assign kernel_input = {image[0], image[1], image[2], image[3], image[4], image[5], image[6], image[7], image[8], image[9], image[10], image[11], image[12], image[13], image[14], image[15], image[16], image[17], image[18], image[19], image[20], image[21], image[22], image[23], image[24]};

  logic [8:0] number_input;
  assign number_input = {image[3*28+8],image[3*28+7],image[3*28+6],image[3*28+5],image[3*28+4],image[3*28+3],image[3*28+2],image[3*28+1],image[3*28]};

  logic [0:25-1] kernel_mem1 [0:18*5-1];
  logic [0:25-1] kernel_mem2 [0:60*18-1];
  logic kernel_mem1_unroll [0:18*5*5*5-1];
  logic kernel_mem2_unroll [0:60*18*5*5-1];
  logic [8-1   :0] mult_weights_fc [0:9];
  logic [60*4*4-1   :0] bin_weights_fc [0:9];
  logic [7-1:0] offset_mem1 [0:18-1];
  logic [9-1:0] offset_mem2 [0:60-1];

  logic [0:4] kmem_addr18;
  logic [0:2] kmem_addr5;
  logic [0:3] kmem_addr10;
  logic [0:5] kmem_addr60;
  logic [0:9] kmem_addr960;
  assign kmem_addr18 = {image[4*28+4], image[4*28+3], image[4*28+2], image[4*28+1], image[4*28+0]};
  assign kmem_addr5 = {image[5*28+2], image[5*28+1], image[5*28+0]};
  assign kmem_addr10 = {image[6*28+3], image[6*28+2], image[6*28+1], image[6*28+0]};
  assign kmem_addr60 = {image[7*28+5], image[7*28+4], image[7*28+3], image[7*28+2], image[7*28+1], image[7*28+0]};
  assign kmem_addr960 = {image[8*28+9], image[8*28+8], image[8*28+7], image[8*28+6], image[8*28+5], image[8*28+4], image[8*28+3], image[8*28+2], image[8*28+1], image[8*28+0]};
  
  genvar x, y, z;
  
  generate
  for(z = 0; z< 25; z++) begin
  for(x = 0; x<18; x++) begin
  for(y = 0; y<5; y++) begin
    assign kernel_mem1_unroll[5*25*x+25*y+z] = kernel_mem1[5*x+y][z];
  end
  end
  end
  endgenerate

generate
  for(z = 0; z< 25; z++) begin
  for(x = 0; x<60; x++) begin
  for(y = 0; y<18; y++) begin
    assign kernel_mem2_unroll[18*25*x+25*y+z] = kernel_mem2[18*x+y][z];
  end
  end
  end
  endgenerate


  always @(posedge clk)
     if( kernel_layer == 2'd1 ) //conv1
       kernel_mem1[kmem_addr18*5+kmem_addr5] <= kernel_input ;
  


  always @(posedge clk)
     if( kernel_layer == 2'd2 ) //conv2
       kernel_mem2[kmem_addr60*18+kmem_addr18] <= kernel_input ;



  always @(posedge clk)
     if( kernel_layer == 2'd3 ) //fc
       bin_weights_fc[kmem_addr10*960+kmem_addr960] <= number_input[0] ;

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
  logic conv1_out[0:12*12*18-1];
  logic conv2_out[0:4*4*60-1];
  logic [0:60*4*4-1] conv2_flatten ;
  logic [16:0] fc_out [0:9];

  conv1_engine c1 (.clk, .image(image_mem), .begin_conv(image_ready), .done_conv(conv1_complete), .kernels(kernel_mem1_unroll), .offset(offset_mem1), .out_fmap(conv1_out));

  conv2_engine c2 (.clk, .image(conv1_out), .begin_conv(conv1_complete), .done_conv(conv2_complete), .kernels(kernel_mem2_unroll), .offset(offset_mem2), .out_fmap(conv2_out));



  generate
  for(x = 0; x<4; x++) begin
   for(y = 0; y<4; y++) begin
    for(z = 0; z<60; z++) begin
     assign conv2_flatten[z*4*4+y*4+x] = conv2_out[z*4*4+y*4+x];
    end
   end
  end
  endgenerate

  fully_connected fc (.clk, .rst_n, .fc_valid(conv2_complete), .sum_valid(fc_complete), .fan_in(conv2_flatten), .weights(mult_weights_fc), .binary_weights(bin_weights_fc), .fan_out(fc_out));

  fastest_argmax10 arg ( .clk, .rst_n, .arg_out_valid(class_out_valid), .arg_in_valid(fc_complete), .bids(fc_out), .win_out(class_out));

endmodule
