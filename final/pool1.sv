module pool1(
    input  logic                clk       ,
    input  logic                rst_n     ,
    input  logic [0:18*24*24-1] fmaps_in  ,
    output logic [0:18*12*12-1] fmaps_out
    );

poolchan1 p_1_0 (.clk, .rst_n, .i_pool_in(fmaps_in[0*24*24:1*24*24-1]), .o_pool_out(fmaps_out[0*12*12:1*12*12-1]));
poolchan1 p_1_1 (.clk, .rst_n, .i_pool_in(fmaps_in[1*24*24:2*24*24-1]), .o_pool_out(fmaps_out[1*12*12:2*12*12-1]));
poolchan1 p_1_2 (.clk, .rst_n, .i_pool_in(fmaps_in[2*24*24:3*24*24-1]), .o_pool_out(fmaps_out[2*12*12:3*12*12-1]));
poolchan1 p_1_3 (.clk, .rst_n, .i_pool_in(fmaps_in[3*24*24:4*24*24-1]), .o_pool_out(fmaps_out[3*12*12:4*12*12-1]));
poolchan1 p_1_4 (.clk, .rst_n, .i_pool_in(fmaps_in[4*24*24:5*24*24-1]), .o_pool_out(fmaps_out[4*12*12:5*12*12-1]));
poolchan1 p_1_5 (.clk, .rst_n, .i_pool_in(fmaps_in[5*24*24:6*24*24-1]), .o_pool_out(fmaps_out[5*12*12:6*12*12-1]));
poolchan1 p_1_6 (.clk, .rst_n, .i_pool_in(fmaps_in[6*24*24:7*24*24-1]), .o_pool_out(fmaps_out[6*12*12:7*12*12-1]));
poolchan1 p_1_7 (.clk, .rst_n, .i_pool_in(fmaps_in[7*24*24:8*24*24-1]), .o_pool_out(fmaps_out[7*12*12:8*12*12-1]));
poolchan1 p_1_8 (.clk, .rst_n, .i_pool_in(fmaps_in[8*24*24:9*24*24-1]), .o_pool_out(fmaps_out[8*12*12:9*12*12-1]));
poolchan1 p_1_9 (.clk, .rst_n, .i_pool_in(fmaps_in[9*24*24:10*24*24-1]), .o_pool_out(fmaps_out[9*12*12:10*12*12-1]));
poolchan1 p_1_10 (.clk, .rst_n, .i_pool_in(fmaps_in[10*24*24:11*24*24-1]), .o_pool_out(fmaps_out[10*12*12:11*12*12-1]));
poolchan1 p_1_11 (.clk, .rst_n, .i_pool_in(fmaps_in[11*24*24:12*24*24-1]), .o_pool_out(fmaps_out[11*12*12:12*12*12-1]));
poolchan1 p_1_12 (.clk, .rst_n, .i_pool_in(fmaps_in[12*24*24:13*24*24-1]), .o_pool_out(fmaps_out[12*12*12:13*12*12-1]));
poolchan1 p_1_13 (.clk, .rst_n, .i_pool_in(fmaps_in[13*24*24:14*24*24-1]), .o_pool_out(fmaps_out[13*12*12:14*12*12-1]));
poolchan1 p_1_14 (.clk, .rst_n, .i_pool_in(fmaps_in[14*24*24:15*24*24-1]), .o_pool_out(fmaps_out[14*12*12:15*12*12-1]));
poolchan1 p_1_15 (.clk, .rst_n, .i_pool_in(fmaps_in[15*24*24:16*24*24-1]), .o_pool_out(fmaps_out[15*12*12:16*12*12-1]));
poolchan1 p_1_16 (.clk, .rst_n, .i_pool_in(fmaps_in[16*24*24:17*24*24-1]), .o_pool_out(fmaps_out[16*12*12:17*12*12-1]));
poolchan1 p_1_17 (.clk, .rst_n, .i_pool_in(fmaps_in[17*24*24:18*24*24-1]), .o_pool_out(fmaps_out[17*12*12:18*12*12-1]));

endmodule