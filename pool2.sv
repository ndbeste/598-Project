`define bW = 8;

module pool2_1 (
    input  logic clk,
    input  logic rst,
    input  logic [bW-1:0] pool_in [0:24][0:24],
    output logic [bW-1:0] pool_out[0:12][0:12]
);

    assign pool_out[0][0] = ~&{pool_in[0][0][0], pool_in[0][1][0], pool_in[1][0][0], pool_in[1][1][0]};
    assign pool_out[1][0] = ~&{pool_in[2][0][0], pool_in[2][1][0], pool_in[3][0][0], pool_in[3][1][0]};
    assign pool_out[2][0] = ~&{pool_in[4][0][0], pool_in[4][1][0], pool_in[5][0][0], pool_in[5][1][0]};
    assign pool_out[3][0] = ~&{pool_in[6][0][0], pool_in[6][1][0], pool_in[7][0][0], pool_in[7][1][0]};

    assign pool_out[0][1] = ~&{pool_in[0][2][0], pool_in[0][3][0], pool_in[1][2][0], pool_in[1][3][0]};
    assign pool_out[1][1] = ~&{pool_in[2][2][0], pool_in[2][3][0], pool_in[3][2][0], pool_in[3][3][0]};
    assign pool_out[2][1] = ~&{pool_in[4][2][0], pool_in[4][3][0], pool_in[5][2][0], pool_in[5][3][0]};
    assign pool_out[3][1] = ~&{pool_in[6][2][0], pool_in[6][3][0], pool_in[7][2][0], pool_in[7][3][0]};

    assign pool_out[0][2] = ~&{pool_in[0][4][0], pool_in[0][5][0], pool_in[1][4][0], pool_in[1][5][0]};
    assign pool_out[1][2] = ~&{pool_in[2][4][0], pool_in[2][5][0], pool_in[3][4][0], pool_in[3][5][0]};
    assign pool_out[2][2] = ~&{pool_in[4][4][0], pool_in[4][5][0], pool_in[5][4][0], pool_in[5][5][0]};
    assign pool_out[3][2] = ~&{pool_in[6][4][0], pool_in[6][5][0], pool_in[7][4][0], pool_in[7][5][0]};

    assign pool_out[0][3] = ~&{pool_in[0][6][0], pool_in[0][7][0], pool_in[1][6][0], pool_in[1][7][0]};
    assign pool_out[1][3] = ~&{pool_in[2][6][0], pool_in[2][7][0], pool_in[3][6][0], pool_in[3][7][0]};
    assign pool_out[2][3] = ~&{pool_in[4][6][0], pool_in[4][7][0], pool_in[5][6][0], pool_in[5][7][0]};
    assign pool_out[3][3] = ~&{pool_in[6][6][0], pool_in[6][7][0], pool_in[7][6][0], pool_in[7][7][0]};

endmodule