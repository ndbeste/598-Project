module pool2(
    input  logic clk,
    input  logic rst_n,
    input  logic fmaps_in  [0:59][0:7][0:7],
    output logic fmaps_out [0:59][0:3][0:3]
    );
poolchan2 p_2_0 (.clk, .rst_n, .pool_in(fmaps_in[0]), .pool_out(fmaps_out[0]));
poolchan2 p_2_1 (.clk, .rst_n, .pool_in(fmaps_in[1]), .pool_out(fmaps_out[1]));
poolchan2 p_2_2 (.clk, .rst_n, .pool_in(fmaps_in[2]), .pool_out(fmaps_out[2]));
poolchan2 p_2_3 (.clk, .rst_n, .pool_in(fmaps_in[3]), .pool_out(fmaps_out[3]));
poolchan2 p_2_4 (.clk, .rst_n, .pool_in(fmaps_in[4]), .pool_out(fmaps_out[4]));
poolchan2 p_2_5 (.clk, .rst_n, .pool_in(fmaps_in[5]), .pool_out(fmaps_out[5]));
poolchan2 p_2_6 (.clk, .rst_n, .pool_in(fmaps_in[6]), .pool_out(fmaps_out[6]));
poolchan2 p_2_7 (.clk, .rst_n, .pool_in(fmaps_in[7]), .pool_out(fmaps_out[7]));
poolchan2 p_2_8 (.clk, .rst_n, .pool_in(fmaps_in[8]), .pool_out(fmaps_out[8]));
poolchan2 p_2_9 (.clk, .rst_n, .pool_in(fmaps_in[9]), .pool_out(fmaps_out[9]));
poolchan2 p_2_10 (.clk, .rst_n, .pool_in(fmaps_in[10]), .pool_out(fmaps_out[10]));
poolchan2 p_2_11 (.clk, .rst_n, .pool_in(fmaps_in[11]), .pool_out(fmaps_out[11]));
poolchan2 p_2_12 (.clk, .rst_n, .pool_in(fmaps_in[12]), .pool_out(fmaps_out[12]));
poolchan2 p_2_13 (.clk, .rst_n, .pool_in(fmaps_in[13]), .pool_out(fmaps_out[13]));
poolchan2 p_2_14 (.clk, .rst_n, .pool_in(fmaps_in[14]), .pool_out(fmaps_out[14]));
poolchan2 p_2_15 (.clk, .rst_n, .pool_in(fmaps_in[15]), .pool_out(fmaps_out[15]));
poolchan2 p_2_16 (.clk, .rst_n, .pool_in(fmaps_in[16]), .pool_out(fmaps_out[16]));
poolchan2 p_2_17 (.clk, .rst_n, .pool_in(fmaps_in[17]), .pool_out(fmaps_out[17]));
poolchan2 p_2_18 (.clk, .rst_n, .pool_in(fmaps_in[18]), .pool_out(fmaps_out[18]));
poolchan2 p_2_19 (.clk, .rst_n, .pool_in(fmaps_in[19]), .pool_out(fmaps_out[19]));
poolchan2 p_2_20 (.clk, .rst_n, .pool_in(fmaps_in[20]), .pool_out(fmaps_out[20]));
poolchan2 p_2_21 (.clk, .rst_n, .pool_in(fmaps_in[21]), .pool_out(fmaps_out[21]));
poolchan2 p_2_22 (.clk, .rst_n, .pool_in(fmaps_in[22]), .pool_out(fmaps_out[22]));
poolchan2 p_2_23 (.clk, .rst_n, .pool_in(fmaps_in[23]), .pool_out(fmaps_out[23]));
poolchan2 p_2_24 (.clk, .rst_n, .pool_in(fmaps_in[24]), .pool_out(fmaps_out[24]));
poolchan2 p_2_25 (.clk, .rst_n, .pool_in(fmaps_in[25]), .pool_out(fmaps_out[25]));
poolchan2 p_2_26 (.clk, .rst_n, .pool_in(fmaps_in[26]), .pool_out(fmaps_out[26]));
poolchan2 p_2_27 (.clk, .rst_n, .pool_in(fmaps_in[27]), .pool_out(fmaps_out[27]));
poolchan2 p_2_28 (.clk, .rst_n, .pool_in(fmaps_in[28]), .pool_out(fmaps_out[28]));
poolchan2 p_2_29 (.clk, .rst_n, .pool_in(fmaps_in[29]), .pool_out(fmaps_out[29]));
poolchan2 p_2_30 (.clk, .rst_n, .pool_in(fmaps_in[30]), .pool_out(fmaps_out[30]));
poolchan2 p_2_31 (.clk, .rst_n, .pool_in(fmaps_in[31]), .pool_out(fmaps_out[31]));
poolchan2 p_2_32 (.clk, .rst_n, .pool_in(fmaps_in[32]), .pool_out(fmaps_out[32]));
poolchan2 p_2_33 (.clk, .rst_n, .pool_in(fmaps_in[33]), .pool_out(fmaps_out[33]));
poolchan2 p_2_34 (.clk, .rst_n, .pool_in(fmaps_in[34]), .pool_out(fmaps_out[34]));
poolchan2 p_2_35 (.clk, .rst_n, .pool_in(fmaps_in[35]), .pool_out(fmaps_out[35]));
poolchan2 p_2_36 (.clk, .rst_n, .pool_in(fmaps_in[36]), .pool_out(fmaps_out[36]));
poolchan2 p_2_37 (.clk, .rst_n, .pool_in(fmaps_in[37]), .pool_out(fmaps_out[37]));
poolchan2 p_2_38 (.clk, .rst_n, .pool_in(fmaps_in[38]), .pool_out(fmaps_out[38]));
poolchan2 p_2_39 (.clk, .rst_n, .pool_in(fmaps_in[39]), .pool_out(fmaps_out[39]));
poolchan2 p_2_40 (.clk, .rst_n, .pool_in(fmaps_in[40]), .pool_out(fmaps_out[40]));
poolchan2 p_2_41 (.clk, .rst_n, .pool_in(fmaps_in[41]), .pool_out(fmaps_out[41]));
poolchan2 p_2_42 (.clk, .rst_n, .pool_in(fmaps_in[42]), .pool_out(fmaps_out[42]));
poolchan2 p_2_43 (.clk, .rst_n, .pool_in(fmaps_in[43]), .pool_out(fmaps_out[43]));
poolchan2 p_2_44 (.clk, .rst_n, .pool_in(fmaps_in[44]), .pool_out(fmaps_out[44]));
poolchan2 p_2_45 (.clk, .rst_n, .pool_in(fmaps_in[45]), .pool_out(fmaps_out[45]));
poolchan2 p_2_46 (.clk, .rst_n, .pool_in(fmaps_in[46]), .pool_out(fmaps_out[46]));
poolchan2 p_2_47 (.clk, .rst_n, .pool_in(fmaps_in[47]), .pool_out(fmaps_out[47]));
poolchan2 p_2_48 (.clk, .rst_n, .pool_in(fmaps_in[48]), .pool_out(fmaps_out[48]));
poolchan2 p_2_49 (.clk, .rst_n, .pool_in(fmaps_in[49]), .pool_out(fmaps_out[49]));
poolchan2 p_2_50 (.clk, .rst_n, .pool_in(fmaps_in[50]), .pool_out(fmaps_out[50]));
poolchan2 p_2_51 (.clk, .rst_n, .pool_in(fmaps_in[51]), .pool_out(fmaps_out[51]));
poolchan2 p_2_52 (.clk, .rst_n, .pool_in(fmaps_in[52]), .pool_out(fmaps_out[52]));
poolchan2 p_2_53 (.clk, .rst_n, .pool_in(fmaps_in[53]), .pool_out(fmaps_out[53]));
poolchan2 p_2_54 (.clk, .rst_n, .pool_in(fmaps_in[54]), .pool_out(fmaps_out[54]));
poolchan2 p_2_55 (.clk, .rst_n, .pool_in(fmaps_in[55]), .pool_out(fmaps_out[55]));
poolchan2 p_2_56 (.clk, .rst_n, .pool_in(fmaps_in[56]), .pool_out(fmaps_out[56]));
poolchan2 p_2_57 (.clk, .rst_n, .pool_in(fmaps_in[57]), .pool_out(fmaps_out[57]));
poolchan2 p_2_58 (.clk, .rst_n, .pool_in(fmaps_in[58]), .pool_out(fmaps_out[58]));
poolchan2 p_2_59 (.clk, .rst_n, .pool_in(fmaps_in[59]), .pool_out(fmaps_out[59]));
endmodule