module conv_pool (
    input  logic clk,
    input  logic rst,
    input  logic [127:0] image_4x4_r,
    input  logic [127:0] image_4x4_g,
    input  logic [127:0] image_4x4_b,
    input  logic [71:0] kernel_r,
    input  logic [71:0] kernel_g,
    input  logic [71:0] kernel_b,
    output logic input_re,
    output logic [15:0] input_addr,
    output logic output_we,
    output logic [15:0] output_addr,
    output logic [7:0] y
);

logic   signed [20:0]  red_conv_out  [1:0][1:0];
logic   signed [20:0]  grn_conv_out  [1:0][1:0];
logic   signed [20:0]  blu_conv_out  [1:0][1:0];
logic   signed [22:0]  all_conv_out  [1:0][1:0];
logic unsigned [7:0]   pool_out      [1:0][1:0];
logic unsigned [9:0]   sum_pool_out;
logic unsigned         en            [3:0];
logic unsigned [7:0]   y_ff;

conv_pool_chan red_conv (.clk, .rst, .image(image_4x4_r), .kernel(kernel_r), .conv_out(red_conv_out) );
conv_pool_chan grn_conv (.clk, .rst, .image(image_4x4_g), .kernel(kernel_g), .conv_out(grn_conv_out) );
conv_pool_chan blu_conv (.clk, .rst, .image(image_4x4_b), .kernel(kernel_b), .conv_out(blu_conv_out) );

assign all_conv_out[0][0] = red_conv_out[0][0] + grn_conv_out[0][0] + blu_conv_out[0][0];
assign all_conv_out[0][1] = red_conv_out[0][1] + grn_conv_out[0][1] + blu_conv_out[0][1];
assign all_conv_out[1][0] = red_conv_out[1][0] + grn_conv_out[1][0] + blu_conv_out[1][0];
assign all_conv_out[1][1] = red_conv_out[1][1] + grn_conv_out[1][1] + blu_conv_out[1][1];

assign pool_out[0][0]     = (all_conv_out[0][0] > 0) ? (all_conv_out[0][0] < 255) ? all_conv_out[0][0] : 8'd255 : 8'd0;
assign pool_out[0][1]     = (all_conv_out[0][1] > 0) ? (all_conv_out[0][1] < 255) ? all_conv_out[0][1] : 8'd255 : 8'd0;
assign pool_out[1][0]     = (all_conv_out[1][0] > 0) ? (all_conv_out[1][0] < 255) ? all_conv_out[1][0] : 8'd255 : 8'd0;
assign pool_out[1][1]     = (all_conv_out[1][1] > 0) ? (all_conv_out[1][1] < 255) ? all_conv_out[1][1] : 8'd255 : 8'd0;

assign sum_pool_out = (pool_out[0][0] + pool_out[0][1] + pool_out[1][0] + pool_out[1][1]);

always_ff @(posedge clk) begin
    if (~rst) input_addr   <= 16'hFFFF;
    else      input_addr   <= input_addr  + 1'b1;
end

always_ff @(posedge clk) begin
    if(~rst) output_addr  <= 16'hFFFA;
    else     output_addr  <= output_addr + 1'b1;
end

always_ff @(posedge clk) begin
    if (~rst) begin
        input_re   <= 1'b0;
        en[0]      <= 1'b0;
        en[1]      <= 1'b0;
        en[2]      <= 1'b0;
        en[3]      <= 1'b0;
        output_we  <= 1'b0;
    end else begin
      input_re   <= 1'b1;
      en[0]      <= input_re;
      en[1]      <= en[0];
      en[2]      <= en[1];
      en[3]      <= en[2];
      output_we  <= en[3];
    end
end

always_ff @(posedge clk) begin
    if(~rst) y_ff    <= 8'd0;
    else     y_ff    <= sum_pool_out >> 2;
end

always_ff @(posedge clk) begin
// synopsis dont_retime true
// synopsis dont_touch  true
    if(~rst) y       <= 8'd0;
    else     y       <= y_ff;
end

endmodule
