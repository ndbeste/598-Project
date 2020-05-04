module conv_pool_channels
#(parameter chan_in = 5,
parameter chan_out = 18,
parameter bW=7)
(
input logic image[0:6*6-1],
input logic kernels[0:chan_out*chan_in*5*5-1],
input logic [bW-1:0] offset [0:chan_out-1],
output logic  pixel [0:chan_out-1] );

conv_pool_pixel125 c0 (.image, .kernels(kernels[0:chan_in*5*5-1]),              .offset(offset[0]), .pixel(pixel[0]));
conv_pool_pixel125 c1 (.image, .kernels(kernels[1*chan_in*5*5:2*chan_in*5*5-1]), .offset(offset[1]), .pixel(pixel[1]));
conv_pool_pixel125 c2 (.image, .kernels(kernels[2*chan_in*5*5:3*chan_in*5*5-1]), .offset(offset[2]), .pixel(pixel[2]));
conv_pool_pixel125 c3 (.image, .kernels(kernels[3*chan_in*5*5:4*chan_in*5*5-1]), .offset(offset[3]), .pixel(pixel[3]));
conv_pool_pixel125 c4 (.image, .kernels(kernels[4*chan_in*5*5:5*chan_in*5*5-1]), .offset(offset[4]), .pixel(pixel[4]));
conv_pool_pixel125 c5 (.image, .kernels(kernels[5*chan_in*5*5:6*chan_in*5*5-1]), .offset(offset[5]), .pixel(pixel[5]));
conv_pool_pixel125 c6 (.image, .kernels(kernels[6*chan_in*5*5:7*chan_in*5*5-1]), .offset(offset[6]), .pixel(pixel[6]));
conv_pool_pixel125 c7 (.image, .kernels(kernels[7*chan_in*5*5:8*chan_in*5*5-1]), .offset(offset[7]), .pixel(pixel[7]));
conv_pool_pixel125 c8 (.image, .kernels(kernels[8*chan_in*5*5:9*chan_in*5*5-1]), .offset(offset[8]), .pixel(pixel[8]));
conv_pool_pixel125 c9 (.image, .kernels(kernels[9*chan_in*5*5:10*chan_in*5*5-1]), .offset(offset[9]), .pixel(pixel[9]));
conv_pool_pixel125 c10 (.image, .kernels(kernels[10*chan_in*5*5:11*chan_in*5*5-1]), .offset(offset[10]), .pixel(pixel[10]));
conv_pool_pixel125 c11 (.image, .kernels(kernels[11*chan_in*5*5:12*chan_in*5*5-1]), .offset(offset[11]), .pixel(pixel[11]));
conv_pool_pixel125 c12 (.image, .kernels(kernels[12*chan_in*5*5:13*chan_in*5*5-1]), .offset(offset[12]), .pixel(pixel[12]));
conv_pool_pixel125 c13 (.image, .kernels(kernels[13*chan_in*5*5:14*chan_in*5*5-1]), .offset(offset[13]), .pixel(pixel[13]));
conv_pool_pixel125 c14 (.image, .kernels(kernels[14*chan_in*5*5:15*chan_in*5*5-1]), .offset(offset[14]), .pixel(pixel[14]));
conv_pool_pixel125 c15 (.image, .kernels(kernels[15*chan_in*5*5:16*chan_in*5*5-1]), .offset(offset[15]), .pixel(pixel[15]));
conv_pool_pixel125 c16 (.image, .kernels(kernels[16*chan_in*5*5:17*chan_in*5*5-1]), .offset(offset[16]), .pixel(pixel[16]));
conv_pool_pixel125 c17 (.image, .kernels(kernels[17*chan_in*5*5:18*chan_in*5*5-1]), .offset(offset[17]), .pixel(pixel[17]));


endmodule
