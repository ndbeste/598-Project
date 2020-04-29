module conv1_10
    #( parameter bW = 8 )
    (
    input  logic [0:28*28-1]         image           ,
    input  logic [0:10*5*5-1]        kernels         , 
    output logic [0:10*24*24*bW-1]   xor_out  
    );

convchan1 c_1_0 (.i_image(image), .i_kernel(kernels[0*5*5:1*5*5-1]), .o_out_fmap(xor_out[0*24*24*bW:1*24*24*bW-1]));
convchan1 c_1_1 (.i_image(image), .i_kernel(kernels[1*5*5:2*5*5-1]), .o_out_fmap(xor_out[1*24*24*bW:2*24*24*bW-1]));
convchan1 c_1_2 (.i_image(image), .i_kernel(kernels[2*5*5:3*5*5-1]), .o_out_fmap(xor_out[2*24*24*bW:3*24*24*bW-1]));
convchan1 c_1_3 (.i_image(image), .i_kernel(kernels[3*5*5:4*5*5-1]), .o_out_fmap(xor_out[3*24*24*bW:4*24*24*bW-1]));
convchan1 c_1_4 (.i_image(image), .i_kernel(kernels[4*5*5:5*5*5-1]), .o_out_fmap(xor_out[4*24*24*bW:5*24*24*bW-1]));
convchan1 c_1_5 (.i_image(image), .i_kernel(kernels[5*5*5:6*5*5-1]), .o_out_fmap(xor_out[5*24*24*bW:6*24*24*bW-1]));
convchan1 c_1_6 (.i_image(image), .i_kernel(kernels[6*5*5:7*5*5-1]), .o_out_fmap(xor_out[6*24*24*bW:7*24*24*bW-1]));
convchan1 c_1_7 (.i_image(image), .i_kernel(kernels[7*5*5:8*5*5-1]), .o_out_fmap(xor_out[7*24*24*bW:8*24*24*bW-1]));
convchan1 c_1_8 (.i_image(image), .i_kernel(kernels[8*5*5:9*5*5-1]), .o_out_fmap(xor_out[8*24*24*bW:9*24*24*bW-1]));
convchan1 c_1_9 (.i_image(image), .i_kernel(kernels[9*5*5:10*5*5-1]), .o_out_fmap(xor_out[9*24*24*bW:10*24*24*bW-1]));

endmodule