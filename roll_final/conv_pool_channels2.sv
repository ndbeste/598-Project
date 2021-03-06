module conv_pool_channels2
#(parameter chan_in = 18,
parameter chan_out = 60,
parameter bW=9)
(
input logic image[0:chan_in*6*6-1],
input logic kernels[0:chan_out*chan_in*5*5-1],
input logic [bW-1:0] offset [0:chan_out-1],
output logic  pixel [0:chan_out-1] );

conv_pool_pixel450 c0 (.image, .kernels(kernels[0*chan_in*5*5:1*chan_in*5*5-1]), .offset(offset[0]), .pixel(pixel[0]));
conv_pool_pixel450 c1 (.image, .kernels(kernels[1*chan_in*5*5:2*chan_in*5*5-1]), .offset(offset[1]), .pixel(pixel[1]));
conv_pool_pixel450 c2 (.image, .kernels(kernels[2*chan_in*5*5:3*chan_in*5*5-1]), .offset(offset[2]), .pixel(pixel[2]));
conv_pool_pixel450 c3 (.image, .kernels(kernels[3*chan_in*5*5:4*chan_in*5*5-1]), .offset(offset[3]), .pixel(pixel[3]));
conv_pool_pixel450 c4 (.image, .kernels(kernels[4*chan_in*5*5:5*chan_in*5*5-1]), .offset(offset[4]), .pixel(pixel[4]));
conv_pool_pixel450 c5 (.image, .kernels(kernels[5*chan_in*5*5:6*chan_in*5*5-1]), .offset(offset[5]), .pixel(pixel[5]));
conv_pool_pixel450 c6 (.image, .kernels(kernels[6*chan_in*5*5:7*chan_in*5*5-1]), .offset(offset[6]), .pixel(pixel[6]));
conv_pool_pixel450 c7 (.image, .kernels(kernels[7*chan_in*5*5:8*chan_in*5*5-1]), .offset(offset[7]), .pixel(pixel[7]));
conv_pool_pixel450 c8 (.image, .kernels(kernels[8*chan_in*5*5:9*chan_in*5*5-1]), .offset(offset[8]), .pixel(pixel[8]));
conv_pool_pixel450 c9 (.image, .kernels(kernels[9*chan_in*5*5:10*chan_in*5*5-1]), .offset(offset[9]), .pixel(pixel[9]));
conv_pool_pixel450 c10 (.image, .kernels(kernels[10*chan_in*5*5:11*chan_in*5*5-1]), .offset(offset[10]), .pixel(pixel[10]));
conv_pool_pixel450 c11 (.image, .kernels(kernels[11*chan_in*5*5:12*chan_in*5*5-1]), .offset(offset[11]), .pixel(pixel[11]));
conv_pool_pixel450 c12 (.image, .kernels(kernels[12*chan_in*5*5:13*chan_in*5*5-1]), .offset(offset[12]), .pixel(pixel[12]));
conv_pool_pixel450 c13 (.image, .kernels(kernels[13*chan_in*5*5:14*chan_in*5*5-1]), .offset(offset[13]), .pixel(pixel[13]));
conv_pool_pixel450 c14 (.image, .kernels(kernels[14*chan_in*5*5:15*chan_in*5*5-1]), .offset(offset[14]), .pixel(pixel[14]));
conv_pool_pixel450 c15 (.image, .kernels(kernels[15*chan_in*5*5:16*chan_in*5*5-1]), .offset(offset[15]), .pixel(pixel[15]));
conv_pool_pixel450 c16 (.image, .kernels(kernels[16*chan_in*5*5:17*chan_in*5*5-1]), .offset(offset[16]), .pixel(pixel[16]));
conv_pool_pixel450 c17 (.image, .kernels(kernels[17*chan_in*5*5:18*chan_in*5*5-1]), .offset(offset[17]), .pixel(pixel[17]));
conv_pool_pixel450 c18 (.image, .kernels(kernels[18*chan_in*5*5:19*chan_in*5*5-1]), .offset(offset[18]), .pixel(pixel[18]));
conv_pool_pixel450 c19 (.image, .kernels(kernels[19*chan_in*5*5:20*chan_in*5*5-1]), .offset(offset[19]), .pixel(pixel[19]));
conv_pool_pixel450 c20 (.image, .kernels(kernels[20*chan_in*5*5:21*chan_in*5*5-1]), .offset(offset[20]), .pixel(pixel[20]));
conv_pool_pixel450 c21 (.image, .kernels(kernels[21*chan_in*5*5:22*chan_in*5*5-1]), .offset(offset[21]), .pixel(pixel[21]));
conv_pool_pixel450 c22 (.image, .kernels(kernels[22*chan_in*5*5:23*chan_in*5*5-1]), .offset(offset[22]), .pixel(pixel[22]));
conv_pool_pixel450 c23 (.image, .kernels(kernels[23*chan_in*5*5:24*chan_in*5*5-1]), .offset(offset[23]), .pixel(pixel[23]));
conv_pool_pixel450 c24 (.image, .kernels(kernels[24*chan_in*5*5:25*chan_in*5*5-1]), .offset(offset[24]), .pixel(pixel[24]));
conv_pool_pixel450 c25 (.image, .kernels(kernels[25*chan_in*5*5:26*chan_in*5*5-1]), .offset(offset[25]), .pixel(pixel[25]));
conv_pool_pixel450 c26 (.image, .kernels(kernels[26*chan_in*5*5:27*chan_in*5*5-1]), .offset(offset[26]), .pixel(pixel[26]));
conv_pool_pixel450 c27 (.image, .kernels(kernels[27*chan_in*5*5:28*chan_in*5*5-1]), .offset(offset[27]), .pixel(pixel[27]));
conv_pool_pixel450 c28 (.image, .kernels(kernels[28*chan_in*5*5:29*chan_in*5*5-1]), .offset(offset[28]), .pixel(pixel[28]));
conv_pool_pixel450 c29 (.image, .kernels(kernels[29*chan_in*5*5:30*chan_in*5*5-1]), .offset(offset[29]), .pixel(pixel[29]));
conv_pool_pixel450 c30 (.image, .kernels(kernels[30*chan_in*5*5:31*chan_in*5*5-1]), .offset(offset[30]), .pixel(pixel[30]));
conv_pool_pixel450 c31 (.image, .kernels(kernels[31*chan_in*5*5:32*chan_in*5*5-1]), .offset(offset[31]), .pixel(pixel[31]));
conv_pool_pixel450 c32 (.image, .kernels(kernels[32*chan_in*5*5:33*chan_in*5*5-1]), .offset(offset[32]), .pixel(pixel[32]));
conv_pool_pixel450 c33 (.image, .kernels(kernels[33*chan_in*5*5:34*chan_in*5*5-1]), .offset(offset[33]), .pixel(pixel[33]));
conv_pool_pixel450 c34 (.image, .kernels(kernels[34*chan_in*5*5:35*chan_in*5*5-1]), .offset(offset[34]), .pixel(pixel[34]));
conv_pool_pixel450 c35 (.image, .kernels(kernels[35*chan_in*5*5:36*chan_in*5*5-1]), .offset(offset[35]), .pixel(pixel[35]));
conv_pool_pixel450 c36 (.image, .kernels(kernels[36*chan_in*5*5:37*chan_in*5*5-1]), .offset(offset[36]), .pixel(pixel[36]));
conv_pool_pixel450 c37 (.image, .kernels(kernels[37*chan_in*5*5:38*chan_in*5*5-1]), .offset(offset[37]), .pixel(pixel[37]));
conv_pool_pixel450 c38 (.image, .kernels(kernels[38*chan_in*5*5:39*chan_in*5*5-1]), .offset(offset[38]), .pixel(pixel[38]));
conv_pool_pixel450 c39 (.image, .kernels(kernels[39*chan_in*5*5:40*chan_in*5*5-1]), .offset(offset[39]), .pixel(pixel[39]));
conv_pool_pixel450 c40 (.image, .kernels(kernels[40*chan_in*5*5:41*chan_in*5*5-1]), .offset(offset[40]), .pixel(pixel[40]));
conv_pool_pixel450 c41 (.image, .kernels(kernels[41*chan_in*5*5:42*chan_in*5*5-1]), .offset(offset[41]), .pixel(pixel[41]));
conv_pool_pixel450 c42 (.image, .kernels(kernels[42*chan_in*5*5:43*chan_in*5*5-1]), .offset(offset[42]), .pixel(pixel[42]));
conv_pool_pixel450 c43 (.image, .kernels(kernels[43*chan_in*5*5:44*chan_in*5*5-1]), .offset(offset[43]), .pixel(pixel[43]));
conv_pool_pixel450 c44 (.image, .kernels(kernels[44*chan_in*5*5:45*chan_in*5*5-1]), .offset(offset[44]), .pixel(pixel[44]));
conv_pool_pixel450 c45 (.image, .kernels(kernels[45*chan_in*5*5:46*chan_in*5*5-1]), .offset(offset[45]), .pixel(pixel[45]));
conv_pool_pixel450 c46 (.image, .kernels(kernels[46*chan_in*5*5:47*chan_in*5*5-1]), .offset(offset[46]), .pixel(pixel[46]));
conv_pool_pixel450 c47 (.image, .kernels(kernels[47*chan_in*5*5:48*chan_in*5*5-1]), .offset(offset[47]), .pixel(pixel[47]));
conv_pool_pixel450 c48 (.image, .kernels(kernels[48*chan_in*5*5:49*chan_in*5*5-1]), .offset(offset[48]), .pixel(pixel[48]));
conv_pool_pixel450 c49 (.image, .kernels(kernels[49*chan_in*5*5:50*chan_in*5*5-1]), .offset(offset[49]), .pixel(pixel[49]));
conv_pool_pixel450 c50 (.image, .kernels(kernels[50*chan_in*5*5:51*chan_in*5*5-1]), .offset(offset[50]), .pixel(pixel[50]));
conv_pool_pixel450 c51 (.image, .kernels(kernels[51*chan_in*5*5:52*chan_in*5*5-1]), .offset(offset[51]), .pixel(pixel[51]));
conv_pool_pixel450 c52 (.image, .kernels(kernels[52*chan_in*5*5:53*chan_in*5*5-1]), .offset(offset[52]), .pixel(pixel[52]));
conv_pool_pixel450 c53 (.image, .kernels(kernels[53*chan_in*5*5:54*chan_in*5*5-1]), .offset(offset[53]), .pixel(pixel[53]));
conv_pool_pixel450 c54 (.image, .kernels(kernels[54*chan_in*5*5:55*chan_in*5*5-1]), .offset(offset[54]), .pixel(pixel[54]));
conv_pool_pixel450 c55 (.image, .kernels(kernels[55*chan_in*5*5:56*chan_in*5*5-1]), .offset(offset[55]), .pixel(pixel[55]));
conv_pool_pixel450 c56 (.image, .kernels(kernels[56*chan_in*5*5:57*chan_in*5*5-1]), .offset(offset[56]), .pixel(pixel[56]));
conv_pool_pixel450 c57 (.image, .kernels(kernels[57*chan_in*5*5:58*chan_in*5*5-1]), .offset(offset[57]), .pixel(pixel[57]));
conv_pool_pixel450 c58 (.image, .kernels(kernels[58*chan_in*5*5:59*chan_in*5*5-1]), .offset(offset[58]), .pixel(pixel[58]));
conv_pool_pixel450 c59 (.image, .kernels(kernels[59*chan_in*5*5:60*chan_in*5*5-1]), .offset(offset[59]), .pixel(pixel[59]));

endmodule
