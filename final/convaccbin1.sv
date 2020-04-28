module convaccbin1
    #( parameter bW = 8 )
    (
    input  logic [0:5*18*24*24*bW-1] xor_in;    output logic [0:18*24*24     -1] conv_one_out  
    );

accbin1 ab_1_0 (.i_accbin_in(xor_out[0*5*24*24*bW:1*5*24*24*bW-1]), .kernel_offset(kernel_offset[0*bW:1*bW-1]), .o_accbin_out(conv_one_out[0*24*24:1*24*24-1]));
accbin1 ab_1_1 (.i_accbin_in(xor_out[1*5*24*24*bW:2*5*24*24*bW-1]), .kernel_offset(kernel_offset[1*bW:2*bW-1]), .o_accbin_out(conv_one_out[1*24*24:2*24*24-1]));
accbin1 ab_1_2 (.i_accbin_in(xor_out[2*5*24*24*bW:3*5*24*24*bW-1]), .kernel_offset(kernel_offset[2*bW:3*bW-1]), .o_accbin_out(conv_one_out[2*24*24:3*24*24-1]));
accbin1 ab_1_3 (.i_accbin_in(xor_out[3*5*24*24*bW:4*5*24*24*bW-1]), .kernel_offset(kernel_offset[3*bW:4*bW-1]), .o_accbin_out(conv_one_out[3*24*24:4*24*24-1]));
accbin1 ab_1_4 (.i_accbin_in(xor_out[4*5*24*24*bW:5*5*24*24*bW-1]), .kernel_offset(kernel_offset[4*bW:5*bW-1]), .o_accbin_out(conv_one_out[4*24*24:5*24*24-1]));
accbin1 ab_1_5 (.i_accbin_in(xor_out[5*5*24*24*bW:6*5*24*24*bW-1]), .kernel_offset(kernel_offset[5*bW:6*bW-1]), .o_accbin_out(conv_one_out[5*24*24:6*24*24-1]));
accbin1 ab_1_6 (.i_accbin_in(xor_out[6*5*24*24*bW:7*5*24*24*bW-1]), .kernel_offset(kernel_offset[6*bW:7*bW-1]), .o_accbin_out(conv_one_out[6*24*24:7*24*24-1]));
accbin1 ab_1_7 (.i_accbin_in(xor_out[7*5*24*24*bW:8*5*24*24*bW-1]), .kernel_offset(kernel_offset[7*bW:8*bW-1]), .o_accbin_out(conv_one_out[7*24*24:8*24*24-1]));
accbin1 ab_1_8 (.i_accbin_in(xor_out[8*5*24*24*bW:9*5*24*24*bW-1]), .kernel_offset(kernel_offset[8*bW:9*bW-1]), .o_accbin_out(conv_one_out[8*24*24:9*24*24-1]));
accbin1 ab_1_9 (.i_accbin_in(xor_out[9*5*24*24*bW:10*5*24*24*bW-1]), .kernel_offset(kernel_offset[9*bW:10*bW-1]), .o_accbin_out(conv_one_out[9*24*24:10*24*24-1]));
accbin1 ab_1_10 (.i_accbin_in(xor_out[10*5*24*24*bW:11*5*24*24*bW-1]), .kernel_offset(kernel_offset[10*bW:11*bW-1]), .o_accbin_out(conv_one_out[10*24*24:11*24*24-1]));
accbin1 ab_1_11 (.i_accbin_in(xor_out[11*5*24*24*bW:12*5*24*24*bW-1]), .kernel_offset(kernel_offset[11*bW:12*bW-1]), .o_accbin_out(conv_one_out[11*24*24:12*24*24-1]));
accbin1 ab_1_12 (.i_accbin_in(xor_out[12*5*24*24*bW:13*5*24*24*bW-1]), .kernel_offset(kernel_offset[12*bW:13*bW-1]), .o_accbin_out(conv_one_out[12*24*24:13*24*24-1]));
accbin1 ab_1_13 (.i_accbin_in(xor_out[13*5*24*24*bW:14*5*24*24*bW-1]), .kernel_offset(kernel_offset[13*bW:14*bW-1]), .o_accbin_out(conv_one_out[13*24*24:14*24*24-1]));
accbin1 ab_1_14 (.i_accbin_in(xor_out[14*5*24*24*bW:15*5*24*24*bW-1]), .kernel_offset(kernel_offset[14*bW:15*bW-1]), .o_accbin_out(conv_one_out[14*24*24:15*24*24-1]));
accbin1 ab_1_15 (.i_accbin_in(xor_out[15*5*24*24*bW:16*5*24*24*bW-1]), .kernel_offset(kernel_offset[15*bW:16*bW-1]), .o_accbin_out(conv_one_out[15*24*24:16*24*24-1]));
accbin1 ab_1_16 (.i_accbin_in(xor_out[16*5*24*24*bW:17*5*24*24*bW-1]), .kernel_offset(kernel_offset[16*bW:17*bW-1]), .o_accbin_out(conv_one_out[16*24*24:17*24*24-1]));
accbin1 ab_1_17 (.i_accbin_in(xor_out[17*5*24*24*bW:18*5*24*24*bW-1]), .kernel_offset(kernel_offset[17*bW:18*bW-1]), .o_accbin_out(conv_one_out[17*24*24:18*24*24-1]));

endmodule