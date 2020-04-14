`define bW = 8;

// TODO: Figure out how to ACTUALLY get the data onto the chip

module top (
    input  logic clk,
    input  logic rst,

    input  logic             image_in_en,
    input  logic [28*28-1:0] image,      // binary image 784 bits
    input  logic [10     :0] image_addr, // binary image

    input  logic             kernel_in_en,
    input  logic [5*5-1  :0] kernel,
    input  logic [bW-1   :0] kernel_value,
    input  logic [5      :0] kernel_addr,

    output logic [:0]    class_out
);

    logic kernel_mem  [0:1169][0: 4][0: 4]; // 5 * 18 + 18 * 60 = 1170
    logic [bW-1 : 0]  offset_mem [0:77]; // 18 (7 bit) + 60 (9bit) = 78
    //fully connected FP mult - 8 bits x10 
    logic image_mem   [0:27][0:27];

    logic [bW-1:0] conv_one_out[0:24][0:24];
    logic [bW-1:0] pool_one_out[0:12][0:12];
    logic [bW-1:0] conv_two_out[0: 8][0: 8];
    logic [bW-1:0] pool_two_out[0: 4][0: 4];

    always_ff @(posedge clk or negedge rst_n) begin
    // synopsis dont_retime true
    // synopsis dont_touch  true
        if(~rst_n)  kernel_mem <= '0;
        else        kernel_mem <= kernel_in_en ? kernel : kernel_mem;
    end

    always_ff @(posedge clk or negedge rst_n) begin
    // synopsis dont_retime true
    // synopsis dont_touch  true
        if(~rst_n)  image_mem <= '0;
        else        image_mem <= image;
    end

    // 5 x duplication of image

    // 18C5
    conv18  c1 (.clk, .rst_n, .image(image_mem), .kernel(kernel_mem[0]), .conv_out(conv_one_out[0]));
    conv18  c2 (.clk, .rst_n, .image(image_mem), .kernel(kernel_mem[1]), .conv_out(conv_one_out[1]));
    // 18 x 5 kernals
    // conv 18 fmaps
    // sum and compare

    //P2 
    pool2_1 p1 (.pool_in(conv_one_out[0]), .pool_out(pool_one_out[0]) );
    pool2_1 p1 (.pool_in(conv_one_out[1]), .pool_out(pool_one_out[1]) );
    // one-bit pool x 18 

    // Pipeline

    // 60C5
    conv60  c1 (.clk, .rst_n, .image(pool_one_out[0]), .kernel(kernel_mem[5]), .conv_out(conv_two_out[0])) ;
    conv60  c1 (.clk, .rst_n, .image(pool_one_out[1]), .kernel(kernel_mem[5]), .conv_out(conv_two_out[0])) ;
    conv60  c1 (.clk, .rst_n, .image(pool_one_out[2]), .kernel(kernel_mem[5]), .conv_out(conv_two_out[0])) ;
     .... 

    conv60  c1 (.clk, .rst_n, .image(pool_one_out[0]), .kernel(kernel_mem[6]), .conv_out(conv_two_out[1])) ;
    conv60  c1 (.clk, .rst_n, .image(pool_one_out[1]), .kernel(kernel_mem[6]), .conv_out(conv_two_out[1])) ;
    // conv 18*60 kernals
    // sum and compare
    // pool x 60

    // P2
    pool2_2 p2 (.pool_in(conv_two_out), .pool_out(pool_two_out) );

    // Pipeline

    // 10 FC


endmodule