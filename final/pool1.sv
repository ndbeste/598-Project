module pool1(
    input  logic           fmaps_in          [0:19][0:23][0:23],
    output logic           fmaps_out         [0:19][0:11][0:11]
    );
pool2_1 p_1_0 (.pool_in(fmaps_in[0]), .conv_out(fmaps_out[0]));
pool2_1 p_1_1 (.pool_in(fmaps_in[1]), .conv_out(fmaps_out[1]));
pool2_1 p_1_2 (.pool_in(fmaps_in[2]), .conv_out(fmaps_out[2]));
pool2_1 p_1_3 (.pool_in(fmaps_in[3]), .conv_out(fmaps_out[3]));
pool2_1 p_1_4 (.pool_in(fmaps_in[4]), .conv_out(fmaps_out[4]));
pool2_1 p_1_5 (.pool_in(fmaps_in[5]), .conv_out(fmaps_out[5]));
pool2_1 p_1_6 (.pool_in(fmaps_in[6]), .conv_out(fmaps_out[6]));
pool2_1 p_1_7 (.pool_in(fmaps_in[7]), .conv_out(fmaps_out[7]));
pool2_1 p_1_8 (.pool_in(fmaps_in[8]), .conv_out(fmaps_out[8]));
pool2_1 p_1_9 (.pool_in(fmaps_in[9]), .conv_out(fmaps_out[9]));
pool2_1 p_1_10 (.pool_in(fmaps_in[10]), .conv_out(fmaps_out[10]));
pool2_1 p_1_11 (.pool_in(fmaps_in[11]), .conv_out(fmaps_out[11]));
pool2_1 p_1_12 (.pool_in(fmaps_in[12]), .conv_out(fmaps_out[12]));
pool2_1 p_1_13 (.pool_in(fmaps_in[13]), .conv_out(fmaps_out[13]));
pool2_1 p_1_14 (.pool_in(fmaps_in[14]), .conv_out(fmaps_out[14]));
pool2_1 p_1_15 (.pool_in(fmaps_in[15]), .conv_out(fmaps_out[15]));
pool2_1 p_1_16 (.pool_in(fmaps_in[16]), .conv_out(fmaps_out[16]));
pool2_1 p_1_17 (.pool_in(fmaps_in[17]), .conv_out(fmaps_out[17]));
pool2_1 p_1_18 (.pool_in(fmaps_in[18]), .conv_out(fmaps_out[18]));
pool2_1 p_1_19 (.pool_in(fmaps_in[19]), .conv_out(fmaps_out[19]));
endmodule