// TODO: Figure out how to ACTUALLY get the data onto the chip

module top
    #( parameter bW = 8,
       parameter fI = 960 )
    (
    input  logic           clk,
    input  logic           rst_n,

    output logic           image_in_ready,
    input  logic           image_in_valid,
    input  logic           image          [0:27][0:27], // binary 28 x 28 image = 784 bits

    input  logic           kernel_in_valid, // assume always ready (one cycle write)
    // input  logic           kernel         [0: 4][0: 4], // 5*5 = 25
    input  logic [bW-1: 0] kernel_offset,
    input  logic [10  : 0] kernel_addr,   // 1200 in layer 2 --> log2(1200) > 10
    input  logic [1   : 0] kernel_layer,  // 1=conv1, 2-conv2, 3=fc

    input  logic           class_out_ready,
    output logic           class_out_valid,
    output logic [3   : 0] class_out
);
    // MEMORY FOR IMAGE AND WEIGHTS
    logic               image_mem           [0:  27][0:27]; 
    logic               kernel_mem_1        [0:  89][0: 4][0: 4]; // 5 * 18 = 90 for first layer
    logic [bW-1 : 0]    offset_mem_1        [0:  19];
    logic               kernel_mem_2        [0:1079][0: 4][0: 4]; // 18 * 60 = 1080 for second layer
    logic [bW-1 : 0]    offset_mem_2        [0:  59];
    logic [bW-1 : 0]    kernel_mem_fc       [0:   9]; 
    logic [fI-1 : 0]    kernel_mem_fc_bin   [0:   9]; // 10 outputs and 960 binary_weights

    // logic [bW-1 : 0]    offset_mem    [0:  77]; // 18 (7 bit) + 60 (9bit) = 78
    //fully connected FP mult - 8 bits x10 
    logic [   bW-1:0] conv_one_out  [0:89][0:23][0:23]; // 16 channels 24x24
    logic [   bW-1:0] pool_one_out  [0:89][0:11][0:11]; // 16 channels 12x12
    logic [   bW-1:0] conv_two_out  [0:59][0: 7][0: 7]; // 60 channels 8x8
    logic [   bW-1:0] pool_two_out  [0:59][0: 3][0: 3]; // 60 channels 4x4
    logic [10+bW-2:0] full_con_out  [0:9]; // 60 channels 4x4

    logic kernel_one_wr, kernel_two_wr, kernel_fc_wr;

    assign kernel_one_wr = kernel_in_valid & ( kernel_value == 2'b01 );
    assign kernel_two_wr = kernel_in_valid & ( kernel_value == 2'b10 );
    assign kernel_fc_wr  = kernel_in_valid & ( kernel_value == 2'b11 );

    logic  kernel        [0:4][0:4];
    assign kernel = image[0:4][0:4];

    logic  [3:0] hand_state;
    logic  [3:0] conv_count;

    localparam WAIT_IMAGE   = 2'd0;
    localparam DO_CONV      = 2'd1;
    localparam WAIT_OUT     = 2'd2;

    always_ff @(posedge clk) begin : proc_hand_state
        if(~rst) begin
            hand_state      <= WAIT_IMAGE;
            conv_count      <= 2'b00;
            image_in_ready  <= 1'b0;
            class_out_valid <= 1'b0;
        end else begin
            case(hand_state)
                WAIT_IMAGE: begin
                    hand_state      <= (image_in_ready & image_in_valid) ? DO_CONV : WAIT_IMAGE;
                    conv_count      <= 2'b00;
                    image_in_ready  <= 1'b1;
                    class_out_valid <= 1'b0;
                end
                DO_CONV: begin
                    hand_state      <= (conv_count == 2'b10) ? WAIT_OUT : DO_CONV;
                    conv_count      <= conv_count + 1'b1;
                    image_in_ready  <= 1'b0;
                    class_out_valid <= 1'b0;
                end
                WAIT_OUT: begin
                    hand_state      <= (class_out_ready & class_out_valid) ? WAIT_IMAGE : WAIT_OUT;
                    conv_count      <= 2'b00;
                    image_in_ready  <= 1'b0;
                    class_out_valid <= 1'b1;
                end
            endcase
        end
    end

    integer i,j,n;
    always_ff @(posedge clk) begin
    // synopsis dont_retime true
    // synopsis dont_touch  true
        if(~rst_n)  begin
            for (n=0; n < 100; n=n+1) begin
                offset_mem_1[n] <= '0;
            end
        end
        else offset_mem_1[kernel_addr] <= kernel_one_wr ? kernel_offset : offset_mem_1[kernel_addr];
    end

    always_ff @(posedge clk) begin
    // synopsis dont_retime true
    // synopsis dont_touch  true
        if(~rst_n)  begin
            for (n=0; n < 100; n=n+1) begin
                for (i=0; i < 5; i=i+1) begin
                    for (j=0; j < 5; j=j+1) begin
                        kernel_mem_1[n][i][j] <= '0;
                    end
                end
            end
        end
        else kernel_mem_1[kernel_addr]  <= kernel_one_wr ? kernel : kernel_mem_1[kernel_addr];
    end

    always_ff @(posedge clk) begin
    // synopsis dont_retime true
    // synopsis dont_touch  true
        if(~rst_n)  begin
            for (n=0; n < 1080; n=n+1) begin
                offset_mem_2[n] <= '0;
            end
        end
        else offset_mem_2[kernel_addr] <= kernel_two_wr ? kernel_offset : offset_mem_2[kernel_addr];
    end

    always_ff @(posedge clk) begin
    // synopsis dont_retime true
    // synopsis dont_touch  true
        if(~rst_n)  begin
            for (n=0; n < 1080; n=n+1) begin
                for (i=0; i < 5; i=i+1) begin
                    for (j=0; j < 5; j=j+1) begin
                        kernel_mem_2[n][i][j] <= '0;
                    end
                end
            end
        end
        else kernel_mem_2[kernel_addr]  <= kernel_two_wr ? kernel : kernel_mem_2[kernel_addr];
    end

    always_ff @(posedge clk) begin
        if(~rst_n) begin
            for(n=0; n<10; n=n+1) begin
                kernel_mem_fc[n] <= '0;
            end
        end else begin
            // input 20 bits at a time
            for(n=0; n<fI/20; n=n+1) begin
                i = n * 20;
                kernel_mem_fc[kernel_addr] <= kernel_fc_wr ? kernel : kernel_mem_fc[kernel_addr]; 
            end
        end
    end

    always_ff @(posedge clk) begin
        if(~rst_n) begin
            for(n=0; n<10; n=n+1) begin
                kernel_mem_fc_bin[n] <= '0;
            end
        end else begin
            // input 20 bits at a time
            for(n=0; n<fI/20; n=n+1) begin
                kernel_mem_fc_bin[kernel_addr][(n*20):(n*20)+19] <= kernel_fc_wr ? image[0][0:19] : kernel_mem_fc[kernel_addr][(n*20):(n*20)+19]; 
            end
        end
    end

    always_ff @(posedge clk) begin
    // synopsis dont_retime true
    // synopsis dont_touch  true
        if(~rst_n)  begin
            for (i=0; i < 28; i=i+1) begin
                for (j=0; j < 28; j=j+1) begin
                    image_mem[i][j] <= '0;
                end
            end
        end
        else image_mem <= (image_in_valid && image_in_ready) ? image : image_mem;
    end

    // Do I need to duplicate the image 5 times here? or is there just 18*5 weights in the first layer?

    // 18C5
    conv1 c1 (.image(image_mem), .kernels(kernel_mem_1), .kernel_offset(offset_mem_1), .conv_one_out);
    // 18 x 5 kernals
    // conv 18 fmaps
    // sum and compare

    //P2 
    pool1 p1 (.clk, .rst_n, .pool_in(conv_one_out), .pool_out(pool_one_out) );
    // one-bit pool x 18 
    // Pipeline inside module

    // 60C5
    conv2 c2 (.image(pool_one_out), .kernels(kernel_mem_2), .kernel_offset(offset_mem_2), .conv_two_out) ;

    // P2
    pool2 p2 (.clk, .rst_n, .pool_in(conv_two_out), .pool_out(pool_two_out) );
    // Pipeline inside module

    // Flatten
    wire [fI-1:0] FC_in;
    for (n=0; n<60; n=n+1) begin
        for (i=0; i<5; i=i+1) begin
            assign FC_in[16*n + 4*i : 16*n + 4*i + 3] = pool_two_out[n][i][0:3];
        end
    end

    // 10 FC
    fully_connected fc1 (.fan_in(FC_in),.weights(kernel_mem_fc),.binary_weights(kernel_mem_fc_bin),.fan_out(full_con_out));

    // argmax10 & output FF
    argmax10 argmax10_1 (.clk, .rst_n, .bids(full_con_out), .win_out(class_out));

endmodule