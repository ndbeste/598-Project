module pool2(
    input  logic clk                    ,
    input  logic rst_n                  ,
    input  logic [0:60*8*8-1] fmaps_in  ,
    output logic [0:60*4*4-1] fmaps_out 
    );

poolchan2 p_2_0 (.clk, .rst_n, .i_pool_in(fmaps_in[0*8*8:1*8*8-1]), .o_pool_out(fmaps_out[0*4*4:1*4*4-1]));
poolchan2 p_2_1 (.clk, .rst_n, .i_pool_in(fmaps_in[1*8*8:2*8*8-1]), .o_pool_out(fmaps_out[1*4*4:2*4*4-1]));
poolchan2 p_2_2 (.clk, .rst_n, .i_pool_in(fmaps_in[2*8*8:3*8*8-1]), .o_pool_out(fmaps_out[2*4*4:3*4*4-1]));
poolchan2 p_2_3 (.clk, .rst_n, .i_pool_in(fmaps_in[3*8*8:4*8*8-1]), .o_pool_out(fmaps_out[3*4*4:4*4*4-1]));
poolchan2 p_2_4 (.clk, .rst_n, .i_pool_in(fmaps_in[4*8*8:5*8*8-1]), .o_pool_out(fmaps_out[4*4*4:5*4*4-1]));
poolchan2 p_2_5 (.clk, .rst_n, .i_pool_in(fmaps_in[5*8*8:6*8*8-1]), .o_pool_out(fmaps_out[5*4*4:6*4*4-1]));
poolchan2 p_2_6 (.clk, .rst_n, .i_pool_in(fmaps_in[6*8*8:7*8*8-1]), .o_pool_out(fmaps_out[6*4*4:7*4*4-1]));
poolchan2 p_2_7 (.clk, .rst_n, .i_pool_in(fmaps_in[7*8*8:8*8*8-1]), .o_pool_out(fmaps_out[7*4*4:8*4*4-1]));
poolchan2 p_2_8 (.clk, .rst_n, .i_pool_in(fmaps_in[8*8*8:9*8*8-1]), .o_pool_out(fmaps_out[8*4*4:9*4*4-1]));
poolchan2 p_2_9 (.clk, .rst_n, .i_pool_in(fmaps_in[9*8*8:10*8*8-1]), .o_pool_out(fmaps_out[9*4*4:10*4*4-1]));
poolchan2 p_2_10 (.clk, .rst_n, .i_pool_in(fmaps_in[10*8*8:11*8*8-1]), .o_pool_out(fmaps_out[10*4*4:11*4*4-1]));
poolchan2 p_2_11 (.clk, .rst_n, .i_pool_in(fmaps_in[11*8*8:12*8*8-1]), .o_pool_out(fmaps_out[11*4*4:12*4*4-1]));
poolchan2 p_2_12 (.clk, .rst_n, .i_pool_in(fmaps_in[12*8*8:13*8*8-1]), .o_pool_out(fmaps_out[12*4*4:13*4*4-1]));
poolchan2 p_2_13 (.clk, .rst_n, .i_pool_in(fmaps_in[13*8*8:14*8*8-1]), .o_pool_out(fmaps_out[13*4*4:14*4*4-1]));
poolchan2 p_2_14 (.clk, .rst_n, .i_pool_in(fmaps_in[14*8*8:15*8*8-1]), .o_pool_out(fmaps_out[14*4*4:15*4*4-1]));
poolchan2 p_2_15 (.clk, .rst_n, .i_pool_in(fmaps_in[15*8*8:16*8*8-1]), .o_pool_out(fmaps_out[15*4*4:16*4*4-1]));
poolchan2 p_2_16 (.clk, .rst_n, .i_pool_in(fmaps_in[16*8*8:17*8*8-1]), .o_pool_out(fmaps_out[16*4*4:17*4*4-1]));
poolchan2 p_2_17 (.clk, .rst_n, .i_pool_in(fmaps_in[17*8*8:18*8*8-1]), .o_pool_out(fmaps_out[17*4*4:18*4*4-1]));
poolchan2 p_2_18 (.clk, .rst_n, .i_pool_in(fmaps_in[18*8*8:19*8*8-1]), .o_pool_out(fmaps_out[18*4*4:19*4*4-1]));
poolchan2 p_2_19 (.clk, .rst_n, .i_pool_in(fmaps_in[19*8*8:20*8*8-1]), .o_pool_out(fmaps_out[19*4*4:20*4*4-1]));
poolchan2 p_2_20 (.clk, .rst_n, .i_pool_in(fmaps_in[20*8*8:21*8*8-1]), .o_pool_out(fmaps_out[20*4*4:21*4*4-1]));
poolchan2 p_2_21 (.clk, .rst_n, .i_pool_in(fmaps_in[21*8*8:22*8*8-1]), .o_pool_out(fmaps_out[21*4*4:22*4*4-1]));
poolchan2 p_2_22 (.clk, .rst_n, .i_pool_in(fmaps_in[22*8*8:23*8*8-1]), .o_pool_out(fmaps_out[22*4*4:23*4*4-1]));
poolchan2 p_2_23 (.clk, .rst_n, .i_pool_in(fmaps_in[23*8*8:24*8*8-1]), .o_pool_out(fmaps_out[23*4*4:24*4*4-1]));
poolchan2 p_2_24 (.clk, .rst_n, .i_pool_in(fmaps_in[24*8*8:25*8*8-1]), .o_pool_out(fmaps_out[24*4*4:25*4*4-1]));
poolchan2 p_2_25 (.clk, .rst_n, .i_pool_in(fmaps_in[25*8*8:26*8*8-1]), .o_pool_out(fmaps_out[25*4*4:26*4*4-1]));
poolchan2 p_2_26 (.clk, .rst_n, .i_pool_in(fmaps_in[26*8*8:27*8*8-1]), .o_pool_out(fmaps_out[26*4*4:27*4*4-1]));
poolchan2 p_2_27 (.clk, .rst_n, .i_pool_in(fmaps_in[27*8*8:28*8*8-1]), .o_pool_out(fmaps_out[27*4*4:28*4*4-1]));
poolchan2 p_2_28 (.clk, .rst_n, .i_pool_in(fmaps_in[28*8*8:29*8*8-1]), .o_pool_out(fmaps_out[28*4*4:29*4*4-1]));
poolchan2 p_2_29 (.clk, .rst_n, .i_pool_in(fmaps_in[29*8*8:30*8*8-1]), .o_pool_out(fmaps_out[29*4*4:30*4*4-1]));
poolchan2 p_2_30 (.clk, .rst_n, .i_pool_in(fmaps_in[30*8*8:31*8*8-1]), .o_pool_out(fmaps_out[30*4*4:31*4*4-1]));
poolchan2 p_2_31 (.clk, .rst_n, .i_pool_in(fmaps_in[31*8*8:32*8*8-1]), .o_pool_out(fmaps_out[31*4*4:32*4*4-1]));
poolchan2 p_2_32 (.clk, .rst_n, .i_pool_in(fmaps_in[32*8*8:33*8*8-1]), .o_pool_out(fmaps_out[32*4*4:33*4*4-1]));
poolchan2 p_2_33 (.clk, .rst_n, .i_pool_in(fmaps_in[33*8*8:34*8*8-1]), .o_pool_out(fmaps_out[33*4*4:34*4*4-1]));
poolchan2 p_2_34 (.clk, .rst_n, .i_pool_in(fmaps_in[34*8*8:35*8*8-1]), .o_pool_out(fmaps_out[34*4*4:35*4*4-1]));
poolchan2 p_2_35 (.clk, .rst_n, .i_pool_in(fmaps_in[35*8*8:36*8*8-1]), .o_pool_out(fmaps_out[35*4*4:36*4*4-1]));
poolchan2 p_2_36 (.clk, .rst_n, .i_pool_in(fmaps_in[36*8*8:37*8*8-1]), .o_pool_out(fmaps_out[36*4*4:37*4*4-1]));
poolchan2 p_2_37 (.clk, .rst_n, .i_pool_in(fmaps_in[37*8*8:38*8*8-1]), .o_pool_out(fmaps_out[37*4*4:38*4*4-1]));
poolchan2 p_2_38 (.clk, .rst_n, .i_pool_in(fmaps_in[38*8*8:39*8*8-1]), .o_pool_out(fmaps_out[38*4*4:39*4*4-1]));
poolchan2 p_2_39 (.clk, .rst_n, .i_pool_in(fmaps_in[39*8*8:40*8*8-1]), .o_pool_out(fmaps_out[39*4*4:40*4*4-1]));
poolchan2 p_2_40 (.clk, .rst_n, .i_pool_in(fmaps_in[40*8*8:41*8*8-1]), .o_pool_out(fmaps_out[40*4*4:41*4*4-1]));
poolchan2 p_2_41 (.clk, .rst_n, .i_pool_in(fmaps_in[41*8*8:42*8*8-1]), .o_pool_out(fmaps_out[41*4*4:42*4*4-1]));
poolchan2 p_2_42 (.clk, .rst_n, .i_pool_in(fmaps_in[42*8*8:43*8*8-1]), .o_pool_out(fmaps_out[42*4*4:43*4*4-1]));
poolchan2 p_2_43 (.clk, .rst_n, .i_pool_in(fmaps_in[43*8*8:44*8*8-1]), .o_pool_out(fmaps_out[43*4*4:44*4*4-1]));
poolchan2 p_2_44 (.clk, .rst_n, .i_pool_in(fmaps_in[44*8*8:45*8*8-1]), .o_pool_out(fmaps_out[44*4*4:45*4*4-1]));
poolchan2 p_2_45 (.clk, .rst_n, .i_pool_in(fmaps_in[45*8*8:46*8*8-1]), .o_pool_out(fmaps_out[45*4*4:46*4*4-1]));
poolchan2 p_2_46 (.clk, .rst_n, .i_pool_in(fmaps_in[46*8*8:47*8*8-1]), .o_pool_out(fmaps_out[46*4*4:47*4*4-1]));
poolchan2 p_2_47 (.clk, .rst_n, .i_pool_in(fmaps_in[47*8*8:48*8*8-1]), .o_pool_out(fmaps_out[47*4*4:48*4*4-1]));
poolchan2 p_2_48 (.clk, .rst_n, .i_pool_in(fmaps_in[48*8*8:49*8*8-1]), .o_pool_out(fmaps_out[48*4*4:49*4*4-1]));
poolchan2 p_2_49 (.clk, .rst_n, .i_pool_in(fmaps_in[49*8*8:50*8*8-1]), .o_pool_out(fmaps_out[49*4*4:50*4*4-1]));
poolchan2 p_2_50 (.clk, .rst_n, .i_pool_in(fmaps_in[50*8*8:51*8*8-1]), .o_pool_out(fmaps_out[50*4*4:51*4*4-1]));
poolchan2 p_2_51 (.clk, .rst_n, .i_pool_in(fmaps_in[51*8*8:52*8*8-1]), .o_pool_out(fmaps_out[51*4*4:52*4*4-1]));
poolchan2 p_2_52 (.clk, .rst_n, .i_pool_in(fmaps_in[52*8*8:53*8*8-1]), .o_pool_out(fmaps_out[52*4*4:53*4*4-1]));
poolchan2 p_2_53 (.clk, .rst_n, .i_pool_in(fmaps_in[53*8*8:54*8*8-1]), .o_pool_out(fmaps_out[53*4*4:54*4*4-1]));
poolchan2 p_2_54 (.clk, .rst_n, .i_pool_in(fmaps_in[54*8*8:55*8*8-1]), .o_pool_out(fmaps_out[54*4*4:55*4*4-1]));
poolchan2 p_2_55 (.clk, .rst_n, .i_pool_in(fmaps_in[55*8*8:56*8*8-1]), .o_pool_out(fmaps_out[55*4*4:56*4*4-1]));
poolchan2 p_2_56 (.clk, .rst_n, .i_pool_in(fmaps_in[56*8*8:57*8*8-1]), .o_pool_out(fmaps_out[56*4*4:57*4*4-1]));
poolchan2 p_2_57 (.clk, .rst_n, .i_pool_in(fmaps_in[57*8*8:58*8*8-1]), .o_pool_out(fmaps_out[57*4*4:58*4*4-1]));
poolchan2 p_2_58 (.clk, .rst_n, .i_pool_in(fmaps_in[58*8*8:59*8*8-1]), .o_pool_out(fmaps_out[58*4*4:59*4*4-1]));
poolchan2 p_2_59 (.clk, .rst_n, .i_pool_in(fmaps_in[59*8*8:60*8*8-1]), .o_pool_out(fmaps_out[59*4*4:60*4*4-1]));

endmodule