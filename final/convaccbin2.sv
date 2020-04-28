module convaccbin2
    #( parameter bW = 8 )
    (
    input  logic [0:18*60*8*8*bW-1] xor_in,
    output logic [0:60*8*8        -1] conv_one_out 
    );

accbin2 ab_2_0 (.i_accbin_in(xor_out[0*18*8*8*bW:1*18*8*8*bW-1]), .kernel_offset(kernel_offset[0*bW:1*bW-1]), .o_accbin_out(conv_one_out[0*8*8:1*8*8-1]));
accbin2 ab_2_1 (.i_accbin_in(xor_out[1*18*8*8*bW:2*18*8*8*bW-1]), .kernel_offset(kernel_offset[1*bW:2*bW-1]), .o_accbin_out(conv_one_out[1*8*8:2*8*8-1]));
accbin2 ab_2_2 (.i_accbin_in(xor_out[2*18*8*8*bW:3*18*8*8*bW-1]), .kernel_offset(kernel_offset[2*bW:3*bW-1]), .o_accbin_out(conv_one_out[2*8*8:3*8*8-1]));
accbin2 ab_2_3 (.i_accbin_in(xor_out[3*18*8*8*bW:4*18*8*8*bW-1]), .kernel_offset(kernel_offset[3*bW:4*bW-1]), .o_accbin_out(conv_one_out[3*8*8:4*8*8-1]));
accbin2 ab_2_4 (.i_accbin_in(xor_out[4*18*8*8*bW:5*18*8*8*bW-1]), .kernel_offset(kernel_offset[4*bW:5*bW-1]), .o_accbin_out(conv_one_out[4*8*8:5*8*8-1]));
accbin2 ab_2_5 (.i_accbin_in(xor_out[5*18*8*8*bW:6*18*8*8*bW-1]), .kernel_offset(kernel_offset[5*bW:6*bW-1]), .o_accbin_out(conv_one_out[5*8*8:6*8*8-1]));
accbin2 ab_2_6 (.i_accbin_in(xor_out[6*18*8*8*bW:7*18*8*8*bW-1]), .kernel_offset(kernel_offset[6*bW:7*bW-1]), .o_accbin_out(conv_one_out[6*8*8:7*8*8-1]));
accbin2 ab_2_7 (.i_accbin_in(xor_out[7*18*8*8*bW:8*18*8*8*bW-1]), .kernel_offset(kernel_offset[7*bW:8*bW-1]), .o_accbin_out(conv_one_out[7*8*8:8*8*8-1]));
accbin2 ab_2_8 (.i_accbin_in(xor_out[8*18*8*8*bW:9*18*8*8*bW-1]), .kernel_offset(kernel_offset[8*bW:9*bW-1]), .o_accbin_out(conv_one_out[8*8*8:9*8*8-1]));
accbin2 ab_2_9 (.i_accbin_in(xor_out[9*18*8*8*bW:10*18*8*8*bW-1]), .kernel_offset(kernel_offset[9*bW:10*bW-1]), .o_accbin_out(conv_one_out[9*8*8:10*8*8-1]));
accbin2 ab_2_10 (.i_accbin_in(xor_out[10*18*8*8*bW:11*18*8*8*bW-1]), .kernel_offset(kernel_offset[10*bW:11*bW-1]), .o_accbin_out(conv_one_out[10*8*8:11*8*8-1]));
accbin2 ab_2_11 (.i_accbin_in(xor_out[11*18*8*8*bW:12*18*8*8*bW-1]), .kernel_offset(kernel_offset[11*bW:12*bW-1]), .o_accbin_out(conv_one_out[11*8*8:12*8*8-1]));
accbin2 ab_2_12 (.i_accbin_in(xor_out[12*18*8*8*bW:13*18*8*8*bW-1]), .kernel_offset(kernel_offset[12*bW:13*bW-1]), .o_accbin_out(conv_one_out[12*8*8:13*8*8-1]));
accbin2 ab_2_13 (.i_accbin_in(xor_out[13*18*8*8*bW:14*18*8*8*bW-1]), .kernel_offset(kernel_offset[13*bW:14*bW-1]), .o_accbin_out(conv_one_out[13*8*8:14*8*8-1]));
accbin2 ab_2_14 (.i_accbin_in(xor_out[14*18*8*8*bW:15*18*8*8*bW-1]), .kernel_offset(kernel_offset[14*bW:15*bW-1]), .o_accbin_out(conv_one_out[14*8*8:15*8*8-1]));
accbin2 ab_2_15 (.i_accbin_in(xor_out[15*18*8*8*bW:16*18*8*8*bW-1]), .kernel_offset(kernel_offset[15*bW:16*bW-1]), .o_accbin_out(conv_one_out[15*8*8:16*8*8-1]));
accbin2 ab_2_16 (.i_accbin_in(xor_out[16*18*8*8*bW:17*18*8*8*bW-1]), .kernel_offset(kernel_offset[16*bW:17*bW-1]), .o_accbin_out(conv_one_out[16*8*8:17*8*8-1]));
accbin2 ab_2_17 (.i_accbin_in(xor_out[17*18*8*8*bW:18*18*8*8*bW-1]), .kernel_offset(kernel_offset[17*bW:18*bW-1]), .o_accbin_out(conv_one_out[17*8*8:18*8*8-1]));
accbin2 ab_2_18 (.i_accbin_in(xor_out[18*18*8*8*bW:19*18*8*8*bW-1]), .kernel_offset(kernel_offset[18*bW:19*bW-1]), .o_accbin_out(conv_one_out[18*8*8:19*8*8-1]));
accbin2 ab_2_19 (.i_accbin_in(xor_out[19*18*8*8*bW:20*18*8*8*bW-1]), .kernel_offset(kernel_offset[19*bW:20*bW-1]), .o_accbin_out(conv_one_out[19*8*8:20*8*8-1]));
accbin2 ab_2_20 (.i_accbin_in(xor_out[20*18*8*8*bW:21*18*8*8*bW-1]), .kernel_offset(kernel_offset[20*bW:21*bW-1]), .o_accbin_out(conv_one_out[20*8*8:21*8*8-1]));
accbin2 ab_2_21 (.i_accbin_in(xor_out[21*18*8*8*bW:22*18*8*8*bW-1]), .kernel_offset(kernel_offset[21*bW:22*bW-1]), .o_accbin_out(conv_one_out[21*8*8:22*8*8-1]));
accbin2 ab_2_22 (.i_accbin_in(xor_out[22*18*8*8*bW:23*18*8*8*bW-1]), .kernel_offset(kernel_offset[22*bW:23*bW-1]), .o_accbin_out(conv_one_out[22*8*8:23*8*8-1]));
accbin2 ab_2_23 (.i_accbin_in(xor_out[23*18*8*8*bW:24*18*8*8*bW-1]), .kernel_offset(kernel_offset[23*bW:24*bW-1]), .o_accbin_out(conv_one_out[23*8*8:24*8*8-1]));
accbin2 ab_2_24 (.i_accbin_in(xor_out[24*18*8*8*bW:25*18*8*8*bW-1]), .kernel_offset(kernel_offset[24*bW:25*bW-1]), .o_accbin_out(conv_one_out[24*8*8:25*8*8-1]));
accbin2 ab_2_25 (.i_accbin_in(xor_out[25*18*8*8*bW:26*18*8*8*bW-1]), .kernel_offset(kernel_offset[25*bW:26*bW-1]), .o_accbin_out(conv_one_out[25*8*8:26*8*8-1]));
accbin2 ab_2_26 (.i_accbin_in(xor_out[26*18*8*8*bW:27*18*8*8*bW-1]), .kernel_offset(kernel_offset[26*bW:27*bW-1]), .o_accbin_out(conv_one_out[26*8*8:27*8*8-1]));
accbin2 ab_2_27 (.i_accbin_in(xor_out[27*18*8*8*bW:28*18*8*8*bW-1]), .kernel_offset(kernel_offset[27*bW:28*bW-1]), .o_accbin_out(conv_one_out[27*8*8:28*8*8-1]));
accbin2 ab_2_28 (.i_accbin_in(xor_out[28*18*8*8*bW:29*18*8*8*bW-1]), .kernel_offset(kernel_offset[28*bW:29*bW-1]), .o_accbin_out(conv_one_out[28*8*8:29*8*8-1]));
accbin2 ab_2_29 (.i_accbin_in(xor_out[29*18*8*8*bW:30*18*8*8*bW-1]), .kernel_offset(kernel_offset[29*bW:30*bW-1]), .o_accbin_out(conv_one_out[29*8*8:30*8*8-1]));
accbin2 ab_2_30 (.i_accbin_in(xor_out[30*18*8*8*bW:31*18*8*8*bW-1]), .kernel_offset(kernel_offset[30*bW:31*bW-1]), .o_accbin_out(conv_one_out[30*8*8:31*8*8-1]));
accbin2 ab_2_31 (.i_accbin_in(xor_out[31*18*8*8*bW:32*18*8*8*bW-1]), .kernel_offset(kernel_offset[31*bW:32*bW-1]), .o_accbin_out(conv_one_out[31*8*8:32*8*8-1]));
accbin2 ab_2_32 (.i_accbin_in(xor_out[32*18*8*8*bW:33*18*8*8*bW-1]), .kernel_offset(kernel_offset[32*bW:33*bW-1]), .o_accbin_out(conv_one_out[32*8*8:33*8*8-1]));
accbin2 ab_2_33 (.i_accbin_in(xor_out[33*18*8*8*bW:34*18*8*8*bW-1]), .kernel_offset(kernel_offset[33*bW:34*bW-1]), .o_accbin_out(conv_one_out[33*8*8:34*8*8-1]));
accbin2 ab_2_34 (.i_accbin_in(xor_out[34*18*8*8*bW:35*18*8*8*bW-1]), .kernel_offset(kernel_offset[34*bW:35*bW-1]), .o_accbin_out(conv_one_out[34*8*8:35*8*8-1]));
accbin2 ab_2_35 (.i_accbin_in(xor_out[35*18*8*8*bW:36*18*8*8*bW-1]), .kernel_offset(kernel_offset[35*bW:36*bW-1]), .o_accbin_out(conv_one_out[35*8*8:36*8*8-1]));
accbin2 ab_2_36 (.i_accbin_in(xor_out[36*18*8*8*bW:37*18*8*8*bW-1]), .kernel_offset(kernel_offset[36*bW:37*bW-1]), .o_accbin_out(conv_one_out[36*8*8:37*8*8-1]));
accbin2 ab_2_37 (.i_accbin_in(xor_out[37*18*8*8*bW:38*18*8*8*bW-1]), .kernel_offset(kernel_offset[37*bW:38*bW-1]), .o_accbin_out(conv_one_out[37*8*8:38*8*8-1]));
accbin2 ab_2_38 (.i_accbin_in(xor_out[38*18*8*8*bW:39*18*8*8*bW-1]), .kernel_offset(kernel_offset[38*bW:39*bW-1]), .o_accbin_out(conv_one_out[38*8*8:39*8*8-1]));
accbin2 ab_2_39 (.i_accbin_in(xor_out[39*18*8*8*bW:40*18*8*8*bW-1]), .kernel_offset(kernel_offset[39*bW:40*bW-1]), .o_accbin_out(conv_one_out[39*8*8:40*8*8-1]));
accbin2 ab_2_40 (.i_accbin_in(xor_out[40*18*8*8*bW:41*18*8*8*bW-1]), .kernel_offset(kernel_offset[40*bW:41*bW-1]), .o_accbin_out(conv_one_out[40*8*8:41*8*8-1]));
accbin2 ab_2_41 (.i_accbin_in(xor_out[41*18*8*8*bW:42*18*8*8*bW-1]), .kernel_offset(kernel_offset[41*bW:42*bW-1]), .o_accbin_out(conv_one_out[41*8*8:42*8*8-1]));
accbin2 ab_2_42 (.i_accbin_in(xor_out[42*18*8*8*bW:43*18*8*8*bW-1]), .kernel_offset(kernel_offset[42*bW:43*bW-1]), .o_accbin_out(conv_one_out[42*8*8:43*8*8-1]));
accbin2 ab_2_43 (.i_accbin_in(xor_out[43*18*8*8*bW:44*18*8*8*bW-1]), .kernel_offset(kernel_offset[43*bW:44*bW-1]), .o_accbin_out(conv_one_out[43*8*8:44*8*8-1]));
accbin2 ab_2_44 (.i_accbin_in(xor_out[44*18*8*8*bW:45*18*8*8*bW-1]), .kernel_offset(kernel_offset[44*bW:45*bW-1]), .o_accbin_out(conv_one_out[44*8*8:45*8*8-1]));
accbin2 ab_2_45 (.i_accbin_in(xor_out[45*18*8*8*bW:46*18*8*8*bW-1]), .kernel_offset(kernel_offset[45*bW:46*bW-1]), .o_accbin_out(conv_one_out[45*8*8:46*8*8-1]));
accbin2 ab_2_46 (.i_accbin_in(xor_out[46*18*8*8*bW:47*18*8*8*bW-1]), .kernel_offset(kernel_offset[46*bW:47*bW-1]), .o_accbin_out(conv_one_out[46*8*8:47*8*8-1]));
accbin2 ab_2_47 (.i_accbin_in(xor_out[47*18*8*8*bW:48*18*8*8*bW-1]), .kernel_offset(kernel_offset[47*bW:48*bW-1]), .o_accbin_out(conv_one_out[47*8*8:48*8*8-1]));
accbin2 ab_2_48 (.i_accbin_in(xor_out[48*18*8*8*bW:49*18*8*8*bW-1]), .kernel_offset(kernel_offset[48*bW:49*bW-1]), .o_accbin_out(conv_one_out[48*8*8:49*8*8-1]));
accbin2 ab_2_49 (.i_accbin_in(xor_out[49*18*8*8*bW:50*18*8*8*bW-1]), .kernel_offset(kernel_offset[49*bW:50*bW-1]), .o_accbin_out(conv_one_out[49*8*8:50*8*8-1]));
accbin2 ab_2_50 (.i_accbin_in(xor_out[50*18*8*8*bW:51*18*8*8*bW-1]), .kernel_offset(kernel_offset[50*bW:51*bW-1]), .o_accbin_out(conv_one_out[50*8*8:51*8*8-1]));
accbin2 ab_2_51 (.i_accbin_in(xor_out[51*18*8*8*bW:52*18*8*8*bW-1]), .kernel_offset(kernel_offset[51*bW:52*bW-1]), .o_accbin_out(conv_one_out[51*8*8:52*8*8-1]));
accbin2 ab_2_52 (.i_accbin_in(xor_out[52*18*8*8*bW:53*18*8*8*bW-1]), .kernel_offset(kernel_offset[52*bW:53*bW-1]), .o_accbin_out(conv_one_out[52*8*8:53*8*8-1]));
accbin2 ab_2_53 (.i_accbin_in(xor_out[53*18*8*8*bW:54*18*8*8*bW-1]), .kernel_offset(kernel_offset[53*bW:54*bW-1]), .o_accbin_out(conv_one_out[53*8*8:54*8*8-1]));
accbin2 ab_2_54 (.i_accbin_in(xor_out[54*18*8*8*bW:55*18*8*8*bW-1]), .kernel_offset(kernel_offset[54*bW:55*bW-1]), .o_accbin_out(conv_one_out[54*8*8:55*8*8-1]));
accbin2 ab_2_55 (.i_accbin_in(xor_out[55*18*8*8*bW:56*18*8*8*bW-1]), .kernel_offset(kernel_offset[55*bW:56*bW-1]), .o_accbin_out(conv_one_out[55*8*8:56*8*8-1]));
accbin2 ab_2_56 (.i_accbin_in(xor_out[56*18*8*8*bW:57*18*8*8*bW-1]), .kernel_offset(kernel_offset[56*bW:57*bW-1]), .o_accbin_out(conv_one_out[56*8*8:57*8*8-1]));
accbin2 ab_2_57 (.i_accbin_in(xor_out[57*18*8*8*bW:58*18*8*8*bW-1]), .kernel_offset(kernel_offset[57*bW:58*bW-1]), .o_accbin_out(conv_one_out[57*8*8:58*8*8-1]));
accbin2 ab_2_58 (.i_accbin_in(xor_out[58*18*8*8*bW:59*18*8*8*bW-1]), .kernel_offset(kernel_offset[58*bW:59*bW-1]), .o_accbin_out(conv_one_out[58*8*8:59*8*8-1]));
accbin2 ab_2_59 (.i_accbin_in(xor_out[59*18*8*8*bW:60*18*8*8*bW-1]), .kernel_offset(kernel_offset[59*bW:60*bW-1]), .o_accbin_out(conv_one_out[59*8*8:60*8*8-1]));

endmodule