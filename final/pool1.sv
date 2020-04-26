module pool1(
    input  logic clk,
    input  logic rst_n,
    input  logic fmaps_in  [0:17][0:23][0:23],
    output logic fmaps_out [0:17][0:11][0:11]
    );
poolchan1 p_1_0 (.clk, .rst_n, .pool_in(fmaps_in[0]), .pool_out(fmaps_out[0]));
poolchan1 p_1_1 (.clk, .rst_n, .pool_in(fmaps_in[1]), .pool_out(fmaps_out[1]));
poolchan1 p_1_2 (.clk, .rst_n, .pool_in(fmaps_in[2]), .pool_out(fmaps_out[2]));
poolchan1 p_1_3 (.clk, .rst_n, .pool_in(fmaps_in[3]), .pool_out(fmaps_out[3]));
poolchan1 p_1_4 (.clk, .rst_n, .pool_in(fmaps_in[4]), .pool_out(fmaps_out[4]));
poolchan1 p_1_5 (.clk, .rst_n, .pool_in(fmaps_in[5]), .pool_out(fmaps_out[5]));
poolchan1 p_1_6 (.clk, .rst_n, .pool_in(fmaps_in[6]), .pool_out(fmaps_out[6]));
poolchan1 p_1_7 (.clk, .rst_n, .pool_in(fmaps_in[7]), .pool_out(fmaps_out[7]));
poolchan1 p_1_8 (.clk, .rst_n, .pool_in(fmaps_in[8]), .pool_out(fmaps_out[8]));
poolchan1 p_1_9 (.clk, .rst_n, .pool_in(fmaps_in[9]), .pool_out(fmaps_out[9]));
poolchan1 p_1_10 (.clk, .rst_n, .pool_in(fmaps_in[10]), .pool_out(fmaps_out[10]));
poolchan1 p_1_11 (.clk, .rst_n, .pool_in(fmaps_in[11]), .pool_out(fmaps_out[11]));
poolchan1 p_1_12 (.clk, .rst_n, .pool_in(fmaps_in[12]), .pool_out(fmaps_out[12]));
poolchan1 p_1_13 (.clk, .rst_n, .pool_in(fmaps_in[13]), .pool_out(fmaps_out[13]));
poolchan1 p_1_14 (.clk, .rst_n, .pool_in(fmaps_in[14]), .pool_out(fmaps_out[14]));
poolchan1 p_1_15 (.clk, .rst_n, .pool_in(fmaps_in[15]), .pool_out(fmaps_out[15]));
poolchan1 p_1_16 (.clk, .rst_n, .pool_in(fmaps_in[16]), .pool_out(fmaps_out[16]));
poolchan1 p_1_17 (.clk, .rst_n, .pool_in(fmaps_in[17]), .pool_out(fmaps_out[17]));
endmodule