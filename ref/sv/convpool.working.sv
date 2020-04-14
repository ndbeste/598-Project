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


logic   signed [19:0]  red_conv_out [1:0][1:0];
logic   signed [19:0]  grn_conv_out [1:0][1:0];
logic   signed [19:0]  blu_conv_out [1:0][1:0];
logic   signed [20:0]  all_conv_out [1:0][1:0];
logic unsigned [7:0]   pool_out     [1:0][1:0];
logic unsigned [9:0]   sum_pool_out;
//logic unsigned [9:0]   y_stage;

// counter = log_2(65,025) = 16
logic unsigned [15:0] counter;

logic [1:0] state;
localparam GETINP    = 2'd0;
localparam DOCALC    = 2'd1;
localparam WRDATA    = 2'd2;
//localparam RESET     = 2'd3;
/*
assign input_re  = rst;
assign output_we = rst;

always_ff @(posedge clk) begin
if (~rst) counter = '0;
else      counter = counter + 1'b1;
end*/

always_ff @(posedge clk) begin
    priority case(1'b1)
        ~rst: begin
            output_we   <= 1'b0;
            output_addr <= '0;
            input_re    <= 1'b0;
            input_addr  <= '0;
            counter     <= '0;
            y           <= '0;
            state       <= GETINP;
        end/*
        (state == RESET): begin
            counter     <= '0;
            state       <= GETINP;
        end*/
        (state == GETINP): begin
            output_we   <= 1'b0;
            output_addr <= '0;
            input_re    <= 1'b1;
            input_addr  <= counter;
            state       <= DOCALC;
        end
        (state == DOCALC): begin
            input_re    <= 1'b0;
            input_addr  <= '0;
            //y_stage     <= sum_pool_out << 2;
            state       <= WRDATA;
        end
        (state == WRDATA): begin
            output_we   <= 1'b1;
            output_addr <= counter;
            y           <= sum_pool_out >> 2;
            counter     <= counter + 1'b1;
            state       <= GETINP;
        end
        default: begin
            state       <= GETINP;
        end
    endcase
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

/*
always_comb begin
   unique case({all_conv_out[0][0] <= 0, all_conv_out[0][0] >= 255})
      2'b10:   pool_out[0][0] = 8'd0;
      2'b01:   pool_out[0][0] = 8'd255;
      2'd00:   pool_out[0][0] = all_conv_out[0][0];
      default: pool_out[0][0] = 8'd0;
   endcase
end

always_comb begin
   unique case({all_conv_out[0][1] <= 0, all_conv_out[0][1] >= 255})
      2'b10:   pool_out[0][1] = 8'd0;
      2'b01:   pool_out[0][1] = 8'd255;
      2'd00:   pool_out[0][1] = all_conv_out[0][1];
      default: pool_out[0][1] = 8'd0;
   endcase
end


always_comb begin
   unique case({all_conv_out[1][0] <= 0, all_conv_out[1][0] >= 255})
      2'b10:   pool_out[1][0] = 8'd0;
      2'b01:   pool_out[1][0] = 8'd255;
      2'd00:   pool_out[1][0] = all_conv_out[1][0];
      default: pool_out[1][0] = 8'd0;
   endcase
end


always_comb begin
   unique case({all_conv_out[1][1] <= 0, all_conv_out[1][1] >= 255})
      2'b10:   pool_out[1][1] = 8'd0;
      2'b01:   pool_out[1][1] = 8'd255;
      2'd00:   pool_out[1][1] = all_conv_out[1][1];
      default: pool_out[1][1] = 8'd0;
   endcase
end
*/

assign sum_pool_out = (pool_out[0][0] + pool_out[0][1] + pool_out[1][0] + pool_out[1][1]);
//assign y = sum_pool_out >> 2;

endmodule


