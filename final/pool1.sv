module pool1(
    input  logic           fmaps_in          [0:19][0:23][0:23],
    output logic           fmaps_out         [0:19][0:11][0:11]
    );
poolchan1 p_1_0 (.pool_in(fmaps_in[0]), .pool_out(fmaps_out[0]));
poolchan1 p_1_1 (.pool_in(fmaps_in[1]), .pool_out(fmaps_out[1]));
poolchan1 p_1_2 (.pool_in(fmaps_in[2]), .pool_out(fmaps_out[2]));
poolchan1 p_1_3 (.pool_in(fmaps_in[3]), .pool_out(fmaps_out[3]));
poolchan1 p_1_4 (.pool_in(fmaps_in[4]), .pool_out(fmaps_out[4]));
poolchan1 p_1_5 (.pool_in(fmaps_in[5]), .pool_out(fmaps_out[5]));
poolchan1 p_1_6 (.pool_in(fmaps_in[6]), .pool_out(fmaps_out[6]));
poolchan1 p_1_7 (.pool_in(fmaps_in[7]), .pool_out(fmaps_out[7]));
poolchan1 p_1_8 (.pool_in(fmaps_in[8]), .pool_out(fmaps_out[8]));
poolchan1 p_1_9 (.pool_in(fmaps_in[9]), .pool_out(fmaps_out[9]));
poolchan1 p_1_10 (.pool_in(fmaps_in[10]), .pool_out(fmaps_out[10]));
poolchan1 p_1_11 (.pool_in(fmaps_in[11]), .pool_out(fmaps_out[11]));
poolchan1 p_1_12 (.pool_in(fmaps_in[12]), .pool_out(fmaps_out[12]));
poolchan1 p_1_13 (.pool_in(fmaps_in[13]), .pool_out(fmaps_out[13]));
poolchan1 p_1_14 (.pool_in(fmaps_in[14]), .pool_out(fmaps_out[14]));
poolchan1 p_1_15 (.pool_in(fmaps_in[15]), .pool_out(fmaps_out[15]));
poolchan1 p_1_16 (.pool_in(fmaps_in[16]), .pool_out(fmaps_out[16]));
poolchan1 p_1_17 (.pool_in(fmaps_in[17]), .pool_out(fmaps_out[17]));
poolchan1 p_1_18 (.pool_in(fmaps_in[18]), .pool_out(fmaps_out[18]));
poolchan1 p_1_19 (.pool_in(fmaps_in[19]), .pool_out(fmaps_out[19]));
endmodule