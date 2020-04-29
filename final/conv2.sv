module conv2
    #( parameter bW = 8 )
    (
    input  logic [0:18*12*12    -1]    image         ,
    input  logic [0:18*60*5*5   -1]    kernels       ,
    output logic [0:18*60*8*8*bW-1]    xor_out 
    );

conv2_120 c_2_120_0 (.i_image(image[0*12*12:2*12*12-1]), .i_kernel(kernels[0*5*5:120*5*5-1]), .o_out_fmap(xor_out[0*8*8*bW:120*8*8*bW-1]));
conv2_120 c_2_120_1 (.i_image(image[0*12*12:2*12*12-1]), .i_kernel(kernels[120*5*5:240*5*5-1]), .o_out_fmap(xor_out[120*8*8*bW:240*8*8*bW-1]));
conv2_120 c_2_120_2 (.i_image(image[0*12*12:2*12*12-1]), .i_kernel(kernels[240*5*5:360*5*5-1]), .o_out_fmap(xor_out[240*8*8*bW:360*8*8*bW-1]));
conv2_120 c_2_120_3 (.i_image(image[0*12*12:2*12*12-1]), .i_kernel(kernels[360*5*5:480*5*5-1]), .o_out_fmap(xor_out[360*8*8*bW:480*8*8*bW-1]));
conv2_120 c_2_120_4 (.i_image(image[0*12*12:2*12*12-1]), .i_kernel(kernels[480*5*5:600*5*5-1]), .o_out_fmap(xor_out[480*8*8*bW:600*8*8*bW-1]));
conv2_120 c_2_120_5 (.i_image(image[0*12*12:2*12*12-1]), .i_kernel(kernels[600*5*5:720*5*5-1]), .o_out_fmap(xor_out[600*8*8*bW:720*8*8*bW-1]));
conv2_120 c_2_120_6 (.i_image(image[0*12*12:2*12*12-1]), .i_kernel(kernels[720*5*5:840*5*5-1]), .o_out_fmap(xor_out[720*8*8*bW:840*8*8*bW-1]));
conv2_120 c_2_120_7 (.i_image(image[0*12*12:2*12*12-1]), .i_kernel(kernels[840*5*5:960*5*5-1]), .o_out_fmap(xor_out[840*8*8*bW:960*8*8*bW-1]));
conv2_120 c_2_120_8 (.i_image(image[0*12*12:2*12*12-1]), .i_kernel(kernels[960*5*5:1080*5*5-1]), .o_out_fmap(xor_out[960*8*8*bW:1080*8*8*bW-1]));

endmodule