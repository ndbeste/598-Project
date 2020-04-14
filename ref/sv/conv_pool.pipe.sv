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


logic   signed [19:0]  red_conv_out  [1:0][1:0];
logic   signed [19:0]  grn_conv_out  [1:0][1:0];
logic   signed [19:0]  blu_conv_out  [1:0][1:0];
logic   signed [20:0]  all_conv_out  [1:0][1:0];
logic unsigned [7:0]   pool_out      [1:0][1:0];
logic unsigned [9:0]   sum_pool_out;
logic unsigned [15:0]  addr          [2:0];
logic unsigned         en            [1:0];
logic unsigned [7:0]   y_ff;

always_ff @(posedge clk) begin
  if(~rst) begin
    input_addr <= 16'hFFFF;
    input_re   <= 1'b0;
  end
  else begin
    input_addr <= input_addr + 1'b1;
    input_re   <= 1'b1;
  end
end

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
    if(~rst) begin
        addr[0]      <= 16'd0;
        addr[1]      <= 16'd0;
        addr[2]      <= 16'd0;
        output_addr  <= 16'd0;
    end
    else begin
        addr[0]      <= input_addr;
        addr[1]      <= addr[0];
        addr[2]      <= addr[1];
        output_addr  <= addr[2];
    end
end

always_ff @(posedge clk) begin
    if(~rst) begin
        en[0]      <= 1'b0;
        en[1]      <= 1'b0;
        output_we  <= 1'b0;
    end
    else begin
        en[0]      <= input_re;
        en[1]      <= en[0];
        output_we  <= en[1];
    end
end

always_ff @(posedge clk) begin
    if(~rst) begin
        y    <= 8'd0;
        y_ff <= 8'd0;
    end
    else begin
        y_ff <= sum_pool_out >> 2;
        y    <= y_ff;
    end
end

endmodule



