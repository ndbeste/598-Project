module conv1
    #( parameter bW = 8 )
    (
    input  logic [0:28*28-1]         image           ,
    input  logic [0:90*5*5-1]        kernels         , 
    output logic [0:5*18*24*24*bW-1] xor_out  
    );

conv1_10 c_1_10_0 (.i_image(image), .i_kernel(kernels[0*5*5:10*5*5-1]), .o_out_fmap(xor_out[0*24*24*bW:10*24*24*bW-1]));
conv1_10 c_1_10_1 (.i_image(image), .i_kernel(kernels[10*5*5:20*5*5-1]), .o_out_fmap(xor_out[10*24*24*bW:20*24*24*bW-1]));
conv1_10 c_1_10_2 (.i_image(image), .i_kernel(kernels[20*5*5:30*5*5-1]), .o_out_fmap(xor_out[20*24*24*bW:30*24*24*bW-1]));
conv1_10 c_1_10_3 (.i_image(image), .i_kernel(kernels[30*5*5:40*5*5-1]), .o_out_fmap(xor_out[30*24*24*bW:40*24*24*bW-1]));
conv1_10 c_1_10_4 (.i_image(image), .i_kernel(kernels[40*5*5:50*5*5-1]), .o_out_fmap(xor_out[40*24*24*bW:50*24*24*bW-1]));
conv1_10 c_1_10_5 (.i_image(image), .i_kernel(kernels[50*5*5:60*5*5-1]), .o_out_fmap(xor_out[50*24*24*bW:60*24*24*bW-1]));
conv1_10 c_1_10_6 (.i_image(image), .i_kernel(kernels[60*5*5:70*5*5-1]), .o_out_fmap(xor_out[60*24*24*bW:70*24*24*bW-1]));
conv1_10 c_1_10_7 (.i_image(image), .i_kernel(kernels[70*5*5:80*5*5-1]), .o_out_fmap(xor_out[70*24*24*bW:80*24*24*bW-1]));
conv1_10 c_1_10_8 (.i_image(image), .i_kernel(kernels[80*5*5:90*5*5-1]), .o_out_fmap(xor_out[80*24*24*bW:90*24*24*bW-1]));

endmodule