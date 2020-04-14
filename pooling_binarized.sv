// 2x2 max pooling

// `define bW = 8; // bit width
// `define  p = 2; // pool "kernel" 

// module maxPooling #( parameter bW = 8 )
module maxPooling
(
    input  logic clk,
    input  logic n_rst,
    // input  logic [bW-1 : 0] pool_in [3 : 0],
    input  logic [3 : 0] pool_in,
    output logic max
);

    // always_ff @(posedge clk or negedge n_rst)
    //     if(~n_rst)  max <= '0;
    //     else        max <= ~&pool_in; // reduction NAND
    //     // else        max <= |{pool_in[0][bW-1], pool_in[1][bW-1], pool_in[2][bW-1], pool_in[3][bW-1]};
    // end

    assign max <= ~&pool_in;

endmodule
