module conv1
    #( parameter bW = 8 )
    (
    input  logic           image           [0:27][0:27],
    input  logic           kernels         [0:89][0: 4][0: 4],
    input  logic [bW-1:0]  kernel_offset   [0:17],
    output logic           conv_one_out    [0:17][0:23][0:23]
    );

logic [bW-1:0] xor_out [0:89][0:23][0:23];

convchan1 c_1_0 (.image, .kernel(kernels[0]), .out_fmap(xor_out[0]));
convchan1 c_1_1 (.image, .kernel(kernels[1]), .out_fmap(xor_out[1]));
convchan1 c_1_2 (.image, .kernel(kernels[2]), .out_fmap(xor_out[2]));
convchan1 c_1_3 (.image, .kernel(kernels[3]), .out_fmap(xor_out[3]));
convchan1 c_1_4 (.image, .kernel(kernels[4]), .out_fmap(xor_out[4]));
convchan1 c_1_5 (.image, .kernel(kernels[5]), .out_fmap(xor_out[5]));
convchan1 c_1_6 (.image, .kernel(kernels[6]), .out_fmap(xor_out[6]));
convchan1 c_1_7 (.image, .kernel(kernels[7]), .out_fmap(xor_out[7]));
convchan1 c_1_8 (.image, .kernel(kernels[8]), .out_fmap(xor_out[8]));
convchan1 c_1_9 (.image, .kernel(kernels[9]), .out_fmap(xor_out[9]));
convchan1 c_1_10 (.image, .kernel(kernels[10]), .out_fmap(xor_out[10]));
convchan1 c_1_11 (.image, .kernel(kernels[11]), .out_fmap(xor_out[11]));
convchan1 c_1_12 (.image, .kernel(kernels[12]), .out_fmap(xor_out[12]));
convchan1 c_1_13 (.image, .kernel(kernels[13]), .out_fmap(xor_out[13]));
convchan1 c_1_14 (.image, .kernel(kernels[14]), .out_fmap(xor_out[14]));
convchan1 c_1_15 (.image, .kernel(kernels[15]), .out_fmap(xor_out[15]));
convchan1 c_1_16 (.image, .kernel(kernels[16]), .out_fmap(xor_out[16]));
convchan1 c_1_17 (.image, .kernel(kernels[17]), .out_fmap(xor_out[17]));
convchan1 c_1_18 (.image, .kernel(kernels[18]), .out_fmap(xor_out[18]));
convchan1 c_1_19 (.image, .kernel(kernels[19]), .out_fmap(xor_out[19]));
convchan1 c_1_20 (.image, .kernel(kernels[20]), .out_fmap(xor_out[20]));
convchan1 c_1_21 (.image, .kernel(kernels[21]), .out_fmap(xor_out[21]));
convchan1 c_1_22 (.image, .kernel(kernels[22]), .out_fmap(xor_out[22]));
convchan1 c_1_23 (.image, .kernel(kernels[23]), .out_fmap(xor_out[23]));
convchan1 c_1_24 (.image, .kernel(kernels[24]), .out_fmap(xor_out[24]));
convchan1 c_1_25 (.image, .kernel(kernels[25]), .out_fmap(xor_out[25]));
convchan1 c_1_26 (.image, .kernel(kernels[26]), .out_fmap(xor_out[26]));
convchan1 c_1_27 (.image, .kernel(kernels[27]), .out_fmap(xor_out[27]));
convchan1 c_1_28 (.image, .kernel(kernels[28]), .out_fmap(xor_out[28]));
convchan1 c_1_29 (.image, .kernel(kernels[29]), .out_fmap(xor_out[29]));
convchan1 c_1_30 (.image, .kernel(kernels[30]), .out_fmap(xor_out[30]));
convchan1 c_1_31 (.image, .kernel(kernels[31]), .out_fmap(xor_out[31]));
convchan1 c_1_32 (.image, .kernel(kernels[32]), .out_fmap(xor_out[32]));
convchan1 c_1_33 (.image, .kernel(kernels[33]), .out_fmap(xor_out[33]));
convchan1 c_1_34 (.image, .kernel(kernels[34]), .out_fmap(xor_out[34]));
convchan1 c_1_35 (.image, .kernel(kernels[35]), .out_fmap(xor_out[35]));
convchan1 c_1_36 (.image, .kernel(kernels[36]), .out_fmap(xor_out[36]));
convchan1 c_1_37 (.image, .kernel(kernels[37]), .out_fmap(xor_out[37]));
convchan1 c_1_38 (.image, .kernel(kernels[38]), .out_fmap(xor_out[38]));
convchan1 c_1_39 (.image, .kernel(kernels[39]), .out_fmap(xor_out[39]));
convchan1 c_1_40 (.image, .kernel(kernels[40]), .out_fmap(xor_out[40]));
convchan1 c_1_41 (.image, .kernel(kernels[41]), .out_fmap(xor_out[41]));
convchan1 c_1_42 (.image, .kernel(kernels[42]), .out_fmap(xor_out[42]));
convchan1 c_1_43 (.image, .kernel(kernels[43]), .out_fmap(xor_out[43]));
convchan1 c_1_44 (.image, .kernel(kernels[44]), .out_fmap(xor_out[44]));
convchan1 c_1_45 (.image, .kernel(kernels[45]), .out_fmap(xor_out[45]));
convchan1 c_1_46 (.image, .kernel(kernels[46]), .out_fmap(xor_out[46]));
convchan1 c_1_47 (.image, .kernel(kernels[47]), .out_fmap(xor_out[47]));
convchan1 c_1_48 (.image, .kernel(kernels[48]), .out_fmap(xor_out[48]));
convchan1 c_1_49 (.image, .kernel(kernels[49]), .out_fmap(xor_out[49]));
convchan1 c_1_50 (.image, .kernel(kernels[50]), .out_fmap(xor_out[50]));
convchan1 c_1_51 (.image, .kernel(kernels[51]), .out_fmap(xor_out[51]));
convchan1 c_1_52 (.image, .kernel(kernels[52]), .out_fmap(xor_out[52]));
convchan1 c_1_53 (.image, .kernel(kernels[53]), .out_fmap(xor_out[53]));
convchan1 c_1_54 (.image, .kernel(kernels[54]), .out_fmap(xor_out[54]));
convchan1 c_1_55 (.image, .kernel(kernels[55]), .out_fmap(xor_out[55]));
convchan1 c_1_56 (.image, .kernel(kernels[56]), .out_fmap(xor_out[56]));
convchan1 c_1_57 (.image, .kernel(kernels[57]), .out_fmap(xor_out[57]));
convchan1 c_1_58 (.image, .kernel(kernels[58]), .out_fmap(xor_out[58]));
convchan1 c_1_59 (.image, .kernel(kernels[59]), .out_fmap(xor_out[59]));
convchan1 c_1_60 (.image, .kernel(kernels[60]), .out_fmap(xor_out[60]));
convchan1 c_1_61 (.image, .kernel(kernels[61]), .out_fmap(xor_out[61]));
convchan1 c_1_62 (.image, .kernel(kernels[62]), .out_fmap(xor_out[62]));
convchan1 c_1_63 (.image, .kernel(kernels[63]), .out_fmap(xor_out[63]));
convchan1 c_1_64 (.image, .kernel(kernels[64]), .out_fmap(xor_out[64]));
convchan1 c_1_65 (.image, .kernel(kernels[65]), .out_fmap(xor_out[65]));
convchan1 c_1_66 (.image, .kernel(kernels[66]), .out_fmap(xor_out[66]));
convchan1 c_1_67 (.image, .kernel(kernels[67]), .out_fmap(xor_out[67]));
convchan1 c_1_68 (.image, .kernel(kernels[68]), .out_fmap(xor_out[68]));
convchan1 c_1_69 (.image, .kernel(kernels[69]), .out_fmap(xor_out[69]));
convchan1 c_1_70 (.image, .kernel(kernels[70]), .out_fmap(xor_out[70]));
convchan1 c_1_71 (.image, .kernel(kernels[71]), .out_fmap(xor_out[71]));
convchan1 c_1_72 (.image, .kernel(kernels[72]), .out_fmap(xor_out[72]));
convchan1 c_1_73 (.image, .kernel(kernels[73]), .out_fmap(xor_out[73]));
convchan1 c_1_74 (.image, .kernel(kernels[74]), .out_fmap(xor_out[74]));
convchan1 c_1_75 (.image, .kernel(kernels[75]), .out_fmap(xor_out[75]));
convchan1 c_1_76 (.image, .kernel(kernels[76]), .out_fmap(xor_out[76]));
convchan1 c_1_77 (.image, .kernel(kernels[77]), .out_fmap(xor_out[77]));
convchan1 c_1_78 (.image, .kernel(kernels[78]), .out_fmap(xor_out[78]));
convchan1 c_1_79 (.image, .kernel(kernels[79]), .out_fmap(xor_out[79]));
convchan1 c_1_80 (.image, .kernel(kernels[80]), .out_fmap(xor_out[80]));
convchan1 c_1_81 (.image, .kernel(kernels[81]), .out_fmap(xor_out[81]));
convchan1 c_1_82 (.image, .kernel(kernels[82]), .out_fmap(xor_out[82]));
convchan1 c_1_83 (.image, .kernel(kernels[83]), .out_fmap(xor_out[83]));
convchan1 c_1_84 (.image, .kernel(kernels[84]), .out_fmap(xor_out[84]));
convchan1 c_1_85 (.image, .kernel(kernels[85]), .out_fmap(xor_out[85]));
convchan1 c_1_86 (.image, .kernel(kernels[86]), .out_fmap(xor_out[86]));
convchan1 c_1_87 (.image, .kernel(kernels[87]), .out_fmap(xor_out[87]));
convchan1 c_1_88 (.image, .kernel(kernels[88]), .out_fmap(xor_out[88]));
convchan1 c_1_89 (.image, .kernel(kernels[89]), .out_fmap(xor_out[89]));

accbin1 ab_1_0 (.accbin_in(xor_out[0:4]), .kernel_offset(kernel_offset[0]), .accbin_out(conv_one_out[0]));
accbin1 ab_1_1 (.accbin_in(xor_out[5:9]), .kernel_offset(kernel_offset[1]), .accbin_out(conv_one_out[1]));
accbin1 ab_1_2 (.accbin_in(xor_out[10:14]), .kernel_offset(kernel_offset[2]), .accbin_out(conv_one_out[2]));
accbin1 ab_1_3 (.accbin_in(xor_out[15:19]), .kernel_offset(kernel_offset[3]), .accbin_out(conv_one_out[3]));
accbin1 ab_1_4 (.accbin_in(xor_out[20:24]), .kernel_offset(kernel_offset[4]), .accbin_out(conv_one_out[4]));
accbin1 ab_1_5 (.accbin_in(xor_out[25:29]), .kernel_offset(kernel_offset[5]), .accbin_out(conv_one_out[5]));
accbin1 ab_1_6 (.accbin_in(xor_out[30:34]), .kernel_offset(kernel_offset[6]), .accbin_out(conv_one_out[6]));
accbin1 ab_1_7 (.accbin_in(xor_out[35:39]), .kernel_offset(kernel_offset[7]), .accbin_out(conv_one_out[7]));
accbin1 ab_1_8 (.accbin_in(xor_out[40:44]), .kernel_offset(kernel_offset[8]), .accbin_out(conv_one_out[8]));
accbin1 ab_1_9 (.accbin_in(xor_out[45:49]), .kernel_offset(kernel_offset[9]), .accbin_out(conv_one_out[9]));
accbin1 ab_1_10 (.accbin_in(xor_out[50:54]), .kernel_offset(kernel_offset[10]), .accbin_out(conv_one_out[10]));
accbin1 ab_1_11 (.accbin_in(xor_out[55:59]), .kernel_offset(kernel_offset[11]), .accbin_out(conv_one_out[11]));
accbin1 ab_1_12 (.accbin_in(xor_out[60:64]), .kernel_offset(kernel_offset[12]), .accbin_out(conv_one_out[12]));
accbin1 ab_1_13 (.accbin_in(xor_out[65:69]), .kernel_offset(kernel_offset[13]), .accbin_out(conv_one_out[13]));
accbin1 ab_1_14 (.accbin_in(xor_out[70:74]), .kernel_offset(kernel_offset[14]), .accbin_out(conv_one_out[14]));
accbin1 ab_1_15 (.accbin_in(xor_out[75:79]), .kernel_offset(kernel_offset[15]), .accbin_out(conv_one_out[15]));
accbin1 ab_1_16 (.accbin_in(xor_out[80:84]), .kernel_offset(kernel_offset[16]), .accbin_out(conv_one_out[16]));
accbin1 ab_1_17 (.accbin_in(xor_out[85:89]), .kernel_offset(kernel_offset[17]), .accbin_out(conv_one_out[17]));

endmodule