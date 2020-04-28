typedef logic       d_fmap1_t     [0:23][0:23] ;
typedef logic       d_pool1_t     [0:11][0:11] ;

module poolchan1 (
    input  logic             clk        ,
    input  logic             rst_n      ,
    input  logic [0:24*24-1] i_pool_in  ,
    output logic [0:12*12-1] o_pool_out
);

d_fmap1_t pool_in  ;
d_pool1_t pool_out ;

genvar i,j;
for (i=0; i<24; i=i+1) begin
    for (j=0; j<24; j=j+1) begin
        assign pool_in[i][j] = i_pool_in[ i*24 + j ];
    end
end

module poolchan1 (
    input  logic clk,
    input  logic rst_n,
    input  logic pool_in [0:23][0:23],
    output logic pool_out[0:11][0:11]
);

always_ff @(posedge clk) begin
    if(~rst_n) begin
        pool_out[0][0] <= 1'b0;
        pool_out[0][1] <= 1'b0;
        pool_out[0][2] <= 1'b0;
        pool_out[0][3] <= 1'b0;
        pool_out[0][4] <= 1'b0;
        pool_out[0][5] <= 1'b0;
        pool_out[0][6] <= 1'b0;
        pool_out[0][7] <= 1'b0;
        pool_out[0][8] <= 1'b0;
        pool_out[0][9] <= 1'b0;
        pool_out[0][10] <= 1'b0;
        pool_out[0][11] <= 1'b0;

        pool_out[1][0] <= 1'b0;
        pool_out[1][1] <= 1'b0;
        pool_out[1][2] <= 1'b0;
        pool_out[1][3] <= 1'b0;
        pool_out[1][4] <= 1'b0;
        pool_out[1][5] <= 1'b0;
        pool_out[1][6] <= 1'b0;
        pool_out[1][7] <= 1'b0;
        pool_out[1][8] <= 1'b0;
        pool_out[1][9] <= 1'b0;
        pool_out[1][10] <= 1'b0;
        pool_out[1][11] <= 1'b0;

        pool_out[2][0] <= 1'b0;
        pool_out[2][1] <= 1'b0;
        pool_out[2][2] <= 1'b0;
        pool_out[2][3] <= 1'b0;
        pool_out[2][4] <= 1'b0;
        pool_out[2][5] <= 1'b0;
        pool_out[2][6] <= 1'b0;
        pool_out[2][7] <= 1'b0;
        pool_out[2][8] <= 1'b0;
        pool_out[2][9] <= 1'b0;
        pool_out[2][10] <= 1'b0;
        pool_out[2][11] <= 1'b0;

        pool_out[3][0] <= 1'b0;
        pool_out[3][1] <= 1'b0;
        pool_out[3][2] <= 1'b0;
        pool_out[3][3] <= 1'b0;
        pool_out[3][4] <= 1'b0;
        pool_out[3][5] <= 1'b0;
        pool_out[3][6] <= 1'b0;
        pool_out[3][7] <= 1'b0;
        pool_out[3][8] <= 1'b0;
        pool_out[3][9] <= 1'b0;
        pool_out[3][10] <= 1'b0;
        pool_out[3][11] <= 1'b0;

        pool_out[4][0] <= 1'b0;
        pool_out[4][1] <= 1'b0;
        pool_out[4][2] <= 1'b0;
        pool_out[4][3] <= 1'b0;
        pool_out[4][4] <= 1'b0;
        pool_out[4][5] <= 1'b0;
        pool_out[4][6] <= 1'b0;
        pool_out[4][7] <= 1'b0;
        pool_out[4][8] <= 1'b0;
        pool_out[4][9] <= 1'b0;
        pool_out[4][10] <= 1'b0;
        pool_out[4][11] <= 1'b0;

        pool_out[5][0] <= 1'b0;
        pool_out[5][1] <= 1'b0;
        pool_out[5][2] <= 1'b0;
        pool_out[5][3] <= 1'b0;
        pool_out[5][4] <= 1'b0;
        pool_out[5][5] <= 1'b0;
        pool_out[5][6] <= 1'b0;
        pool_out[5][7] <= 1'b0;
        pool_out[5][8] <= 1'b0;
        pool_out[5][9] <= 1'b0;
        pool_out[5][10] <= 1'b0;
        pool_out[5][11] <= 1'b0;

        pool_out[6][0] <= 1'b0;
        pool_out[6][1] <= 1'b0;
        pool_out[6][2] <= 1'b0;
        pool_out[6][3] <= 1'b0;
        pool_out[6][4] <= 1'b0;
        pool_out[6][5] <= 1'b0;
        pool_out[6][6] <= 1'b0;
        pool_out[6][7] <= 1'b0;
        pool_out[6][8] <= 1'b0;
        pool_out[6][9] <= 1'b0;
        pool_out[6][10] <= 1'b0;
        pool_out[6][11] <= 1'b0;

        pool_out[7][0] <= 1'b0;
        pool_out[7][1] <= 1'b0;
        pool_out[7][2] <= 1'b0;
        pool_out[7][3] <= 1'b0;
        pool_out[7][4] <= 1'b0;
        pool_out[7][5] <= 1'b0;
        pool_out[7][6] <= 1'b0;
        pool_out[7][7] <= 1'b0;
        pool_out[7][8] <= 1'b0;
        pool_out[7][9] <= 1'b0;
        pool_out[7][10] <= 1'b0;
        pool_out[7][11] <= 1'b0;

        pool_out[8][0] <= 1'b0;
        pool_out[8][1] <= 1'b0;
        pool_out[8][2] <= 1'b0;
        pool_out[8][3] <= 1'b0;
        pool_out[8][4] <= 1'b0;
        pool_out[8][5] <= 1'b0;
        pool_out[8][6] <= 1'b0;
        pool_out[8][7] <= 1'b0;
        pool_out[8][8] <= 1'b0;
        pool_out[8][9] <= 1'b0;
        pool_out[8][10] <= 1'b0;
        pool_out[8][11] <= 1'b0;

        pool_out[9][0] <= 1'b0;
        pool_out[9][1] <= 1'b0;
        pool_out[9][2] <= 1'b0;
        pool_out[9][3] <= 1'b0;
        pool_out[9][4] <= 1'b0;
        pool_out[9][5] <= 1'b0;
        pool_out[9][6] <= 1'b0;
        pool_out[9][7] <= 1'b0;
        pool_out[9][8] <= 1'b0;
        pool_out[9][9] <= 1'b0;
        pool_out[9][10] <= 1'b0;
        pool_out[9][11] <= 1'b0;

        pool_out[10][0] <= 1'b0;
        pool_out[10][1] <= 1'b0;
        pool_out[10][2] <= 1'b0;
        pool_out[10][3] <= 1'b0;
        pool_out[10][4] <= 1'b0;
        pool_out[10][5] <= 1'b0;
        pool_out[10][6] <= 1'b0;
        pool_out[10][7] <= 1'b0;
        pool_out[10][8] <= 1'b0;
        pool_out[10][9] <= 1'b0;
        pool_out[10][10] <= 1'b0;
        pool_out[10][11] <= 1'b0;

        pool_out[11][0] <= 1'b0;
        pool_out[11][1] <= 1'b0;
        pool_out[11][2] <= 1'b0;
        pool_out[11][3] <= 1'b0;
        pool_out[11][4] <= 1'b0;
        pool_out[11][5] <= 1'b0;
        pool_out[11][6] <= 1'b0;
        pool_out[11][7] <= 1'b0;
        pool_out[11][8] <= 1'b0;
        pool_out[11][9] <= 1'b0;
        pool_out[11][10] <= 1'b0;
        pool_out[11][11] <= 1'b0;

    end else begin
        pool_out[0 ][0 ] <= |{pool_in[0 ][0 ], pool_in[0 ][1 ], pool_in[1 ][0 ], pool_in[1 ][1 ]};
        pool_out[0 ][1 ] <= |{pool_in[0 ][2 ], pool_in[0 ][3 ], pool_in[1 ][2 ], pool_in[1 ][3 ]};
        pool_out[0 ][2 ] <= |{pool_in[0 ][4 ], pool_in[0 ][5 ], pool_in[1 ][4 ], pool_in[1 ][5 ]};
        pool_out[0 ][3 ] <= |{pool_in[0 ][6 ], pool_in[0 ][7 ], pool_in[1 ][6 ], pool_in[1 ][7 ]};
        pool_out[0 ][4 ] <= |{pool_in[0 ][8 ], pool_in[0 ][9 ], pool_in[1 ][8 ], pool_in[1 ][9 ]};
        pool_out[0 ][5 ] <= |{pool_in[0 ][10], pool_in[0 ][11], pool_in[1 ][10], pool_in[1 ][11]};
        pool_out[0 ][6 ] <= |{pool_in[0 ][12], pool_in[0 ][13], pool_in[1 ][12], pool_in[1 ][13]};
        pool_out[0 ][7 ] <= |{pool_in[0 ][14], pool_in[0 ][15], pool_in[1 ][14], pool_in[1 ][15]};
        pool_out[0 ][8 ] <= |{pool_in[0 ][16], pool_in[0 ][17], pool_in[1 ][16], pool_in[1 ][17]};
        pool_out[0 ][9 ] <= |{pool_in[0 ][18], pool_in[0 ][19], pool_in[1 ][18], pool_in[1 ][19]};
        pool_out[0 ][10] <= |{pool_in[0 ][20], pool_in[0 ][21], pool_in[1 ][20], pool_in[1 ][21]};
        pool_out[0 ][11] <= |{pool_in[0 ][22], pool_in[0 ][23], pool_in[1 ][22], pool_in[1 ][23]};

        pool_out[1 ][0 ] <= |{pool_in[2 ][0 ], pool_in[2 ][1 ], pool_in[3 ][0 ], pool_in[3 ][1 ]};
        pool_out[1 ][1 ] <= |{pool_in[2 ][2 ], pool_in[2 ][3 ], pool_in[3 ][2 ], pool_in[3 ][3 ]};
        pool_out[1 ][2 ] <= |{pool_in[2 ][4 ], pool_in[2 ][5 ], pool_in[3 ][4 ], pool_in[3 ][5 ]};
        pool_out[1 ][3 ] <= |{pool_in[2 ][6 ], pool_in[2 ][7 ], pool_in[3 ][6 ], pool_in[3 ][7 ]};
        pool_out[1 ][4 ] <= |{pool_in[2 ][8 ], pool_in[2 ][9 ], pool_in[3 ][8 ], pool_in[3 ][9 ]};
        pool_out[1 ][5 ] <= |{pool_in[2 ][10], pool_in[2 ][11], pool_in[3 ][10], pool_in[3 ][11]};
        pool_out[1 ][6 ] <= |{pool_in[2 ][12], pool_in[2 ][13], pool_in[3 ][12], pool_in[3 ][13]};
        pool_out[1 ][7 ] <= |{pool_in[2 ][14], pool_in[2 ][15], pool_in[3 ][14], pool_in[3 ][15]};
        pool_out[1 ][8 ] <= |{pool_in[2 ][16], pool_in[2 ][17], pool_in[3 ][16], pool_in[3 ][17]};
        pool_out[1 ][9 ] <= |{pool_in[2 ][18], pool_in[2 ][19], pool_in[3 ][18], pool_in[3 ][19]};
        pool_out[1 ][10] <= |{pool_in[2 ][20], pool_in[2 ][21], pool_in[3 ][20], pool_in[3 ][21]};
        pool_out[1 ][11] <= |{pool_in[2 ][22], pool_in[2 ][23], pool_in[3 ][22], pool_in[3 ][23]};

        pool_out[2 ][0 ] <= |{pool_in[4 ][0 ], pool_in[4 ][1 ], pool_in[5 ][0 ], pool_in[5 ][1 ]};
        pool_out[2 ][1 ] <= |{pool_in[4 ][2 ], pool_in[4 ][3 ], pool_in[5 ][2 ], pool_in[5 ][3 ]};
        pool_out[2 ][2 ] <= |{pool_in[4 ][4 ], pool_in[4 ][5 ], pool_in[5 ][4 ], pool_in[5 ][5 ]};
        pool_out[2 ][3 ] <= |{pool_in[4 ][6 ], pool_in[4 ][7 ], pool_in[5 ][6 ], pool_in[5 ][7 ]};
        pool_out[2 ][4 ] <= |{pool_in[4 ][8 ], pool_in[4 ][9 ], pool_in[5 ][8 ], pool_in[5 ][9 ]};
        pool_out[2 ][5 ] <= |{pool_in[4 ][10], pool_in[4 ][11], pool_in[5 ][10], pool_in[5 ][11]};
        pool_out[2 ][6 ] <= |{pool_in[4 ][12], pool_in[4 ][13], pool_in[5 ][12], pool_in[5 ][13]};
        pool_out[2 ][7 ] <= |{pool_in[4 ][14], pool_in[4 ][15], pool_in[5 ][14], pool_in[5 ][15]};
        pool_out[2 ][8 ] <= |{pool_in[4 ][16], pool_in[4 ][17], pool_in[5 ][16], pool_in[5 ][17]};
        pool_out[2 ][9 ] <= |{pool_in[4 ][18], pool_in[4 ][19], pool_in[5 ][18], pool_in[5 ][19]};
        pool_out[2 ][10] <= |{pool_in[4 ][20], pool_in[4 ][21], pool_in[5 ][20], pool_in[5 ][21]};
        pool_out[2 ][11] <= |{pool_in[4 ][22], pool_in[4 ][23], pool_in[5 ][22], pool_in[5 ][23]};

        pool_out[3 ][0 ] <= |{pool_in[6 ][0 ], pool_in[6 ][1 ], pool_in[7 ][0 ], pool_in[7 ][1 ]};
        pool_out[3 ][1 ] <= |{pool_in[6 ][2 ], pool_in[6 ][3 ], pool_in[7 ][2 ], pool_in[7 ][3 ]};
        pool_out[3 ][2 ] <= |{pool_in[6 ][4 ], pool_in[6 ][5 ], pool_in[7 ][4 ], pool_in[7 ][5 ]};
        pool_out[3 ][3 ] <= |{pool_in[6 ][6 ], pool_in[6 ][7 ], pool_in[7 ][6 ], pool_in[7 ][7 ]};
        pool_out[3 ][4 ] <= |{pool_in[6 ][8 ], pool_in[6 ][9 ], pool_in[7 ][8 ], pool_in[7 ][9 ]};
        pool_out[3 ][5 ] <= |{pool_in[6 ][10], pool_in[6 ][11], pool_in[7 ][10], pool_in[7 ][11]};
        pool_out[3 ][6 ] <= |{pool_in[6 ][12], pool_in[6 ][13], pool_in[7 ][12], pool_in[7 ][13]};
        pool_out[3 ][7 ] <= |{pool_in[6 ][14], pool_in[6 ][15], pool_in[7 ][14], pool_in[7 ][15]};
        pool_out[3 ][8 ] <= |{pool_in[6 ][16], pool_in[6 ][17], pool_in[7 ][16], pool_in[7 ][17]};
        pool_out[3 ][9 ] <= |{pool_in[6 ][18], pool_in[6 ][19], pool_in[7 ][18], pool_in[7 ][19]};
        pool_out[3 ][10] <= |{pool_in[6 ][20], pool_in[6 ][21], pool_in[7 ][20], pool_in[7 ][21]};
        pool_out[3 ][11] <= |{pool_in[6 ][22], pool_in[6 ][23], pool_in[7 ][22], pool_in[7 ][23]};

        pool_out[4 ][0 ] <= |{pool_in[8 ][0 ], pool_in[8 ][1 ], pool_in[9 ][0 ], pool_in[9 ][1 ]};
        pool_out[4 ][1 ] <= |{pool_in[8 ][2 ], pool_in[8 ][3 ], pool_in[9 ][2 ], pool_in[9 ][3 ]};
        pool_out[4 ][2 ] <= |{pool_in[8 ][4 ], pool_in[8 ][5 ], pool_in[9 ][4 ], pool_in[9 ][5 ]};
        pool_out[4 ][3 ] <= |{pool_in[8 ][6 ], pool_in[8 ][7 ], pool_in[9 ][6 ], pool_in[9 ][7 ]};
        pool_out[4 ][4 ] <= |{pool_in[8 ][8 ], pool_in[8 ][9 ], pool_in[9 ][8 ], pool_in[9 ][9 ]};
        pool_out[4 ][5 ] <= |{pool_in[8 ][10], pool_in[8 ][11], pool_in[9 ][10], pool_in[9 ][11]};
        pool_out[4 ][6 ] <= |{pool_in[8 ][12], pool_in[8 ][13], pool_in[9 ][12], pool_in[9 ][13]};
        pool_out[4 ][7 ] <= |{pool_in[8 ][14], pool_in[8 ][15], pool_in[9 ][14], pool_in[9 ][15]};
        pool_out[4 ][8 ] <= |{pool_in[8 ][16], pool_in[8 ][17], pool_in[9 ][16], pool_in[9 ][17]};
        pool_out[4 ][9 ] <= |{pool_in[8 ][18], pool_in[8 ][19], pool_in[9 ][18], pool_in[9 ][19]};
        pool_out[4 ][10] <= |{pool_in[8 ][20], pool_in[8 ][21], pool_in[9 ][20], pool_in[9 ][21]};
        pool_out[4 ][11] <= |{pool_in[8 ][22], pool_in[8 ][23], pool_in[9 ][22], pool_in[9 ][23]};

        pool_out[5 ][0 ] <= |{pool_in[10][0 ], pool_in[10][1 ], pool_in[11][0 ], pool_in[11][1 ]};
        pool_out[5 ][1 ] <= |{pool_in[10][2 ], pool_in[10][3 ], pool_in[11][2 ], pool_in[11][3 ]};
        pool_out[5 ][2 ] <= |{pool_in[10][4 ], pool_in[10][5 ], pool_in[11][4 ], pool_in[11][5 ]};
        pool_out[5 ][3 ] <= |{pool_in[10][6 ], pool_in[10][7 ], pool_in[11][6 ], pool_in[11][7 ]};
        pool_out[5 ][4 ] <= |{pool_in[10][8 ], pool_in[10][9 ], pool_in[11][8 ], pool_in[11][9 ]};
        pool_out[5 ][5 ] <= |{pool_in[10][10], pool_in[10][11], pool_in[11][10], pool_in[11][11]};
        pool_out[5 ][6 ] <= |{pool_in[10][12], pool_in[10][13], pool_in[11][12], pool_in[11][13]};
        pool_out[5 ][7 ] <= |{pool_in[10][14], pool_in[10][15], pool_in[11][14], pool_in[11][15]};
        pool_out[5 ][8 ] <= |{pool_in[10][16], pool_in[10][17], pool_in[11][16], pool_in[11][17]};
        pool_out[5 ][9 ] <= |{pool_in[10][18], pool_in[10][19], pool_in[11][18], pool_in[11][19]};
        pool_out[5 ][10] <= |{pool_in[10][20], pool_in[10][21], pool_in[11][20], pool_in[11][21]};
        pool_out[5 ][11] <= |{pool_in[10][22], pool_in[10][23], pool_in[11][22], pool_in[11][23]};

        pool_out[6 ][0 ] <= |{pool_in[12][0 ], pool_in[12][1 ], pool_in[13][0 ], pool_in[13][1 ]};
        pool_out[6 ][1 ] <= |{pool_in[12][2 ], pool_in[12][3 ], pool_in[13][2 ], pool_in[13][3 ]};
        pool_out[6 ][2 ] <= |{pool_in[12][4 ], pool_in[12][5 ], pool_in[13][4 ], pool_in[13][5 ]};
        pool_out[6 ][3 ] <= |{pool_in[12][6 ], pool_in[12][7 ], pool_in[13][6 ], pool_in[13][7 ]};
        pool_out[6 ][4 ] <= |{pool_in[12][8 ], pool_in[12][9 ], pool_in[13][8 ], pool_in[13][9 ]};
        pool_out[6 ][5 ] <= |{pool_in[12][10], pool_in[12][11], pool_in[13][10], pool_in[13][11]};
        pool_out[6 ][6 ] <= |{pool_in[12][12], pool_in[12][13], pool_in[13][12], pool_in[13][13]};
        pool_out[6 ][7 ] <= |{pool_in[12][14], pool_in[12][15], pool_in[13][14], pool_in[13][15]};
        pool_out[6 ][8 ] <= |{pool_in[12][16], pool_in[12][17], pool_in[13][16], pool_in[13][17]};
        pool_out[6 ][9 ] <= |{pool_in[12][18], pool_in[12][19], pool_in[13][18], pool_in[13][19]};
        pool_out[6 ][10] <= |{pool_in[12][20], pool_in[12][21], pool_in[13][20], pool_in[13][21]};
        pool_out[6 ][11] <= |{pool_in[12][22], pool_in[12][23], pool_in[13][22], pool_in[13][23]};

        pool_out[7 ][0 ] <= |{pool_in[14][0 ], pool_in[14][1 ], pool_in[15][0 ], pool_in[15][1 ]};
        pool_out[7 ][1 ] <= |{pool_in[14][2 ], pool_in[14][3 ], pool_in[15][2 ], pool_in[15][3 ]};
        pool_out[7 ][2 ] <= |{pool_in[14][4 ], pool_in[14][5 ], pool_in[15][4 ], pool_in[15][5 ]};
        pool_out[7 ][3 ] <= |{pool_in[14][6 ], pool_in[14][7 ], pool_in[15][6 ], pool_in[15][7 ]};
        pool_out[7 ][4 ] <= |{pool_in[14][8 ], pool_in[14][9 ], pool_in[15][8 ], pool_in[15][9 ]};
        pool_out[7 ][5 ] <= |{pool_in[14][10], pool_in[14][11], pool_in[15][10], pool_in[15][11]};
        pool_out[7 ][6 ] <= |{pool_in[14][12], pool_in[14][13], pool_in[15][12], pool_in[15][13]};
        pool_out[7 ][7 ] <= |{pool_in[14][14], pool_in[14][15], pool_in[15][14], pool_in[15][15]};
        pool_out[7 ][8 ] <= |{pool_in[14][16], pool_in[14][17], pool_in[15][16], pool_in[15][17]};
        pool_out[7 ][9 ] <= |{pool_in[14][18], pool_in[14][19], pool_in[15][18], pool_in[15][19]};
        pool_out[7 ][10] <= |{pool_in[14][20], pool_in[14][21], pool_in[15][20], pool_in[15][21]};
        pool_out[7 ][11] <= |{pool_in[14][22], pool_in[14][23], pool_in[15][22], pool_in[15][23]};

        pool_out[8 ][0 ] <= |{pool_in[16][0 ], pool_in[16][1 ], pool_in[17][0 ], pool_in[17][1 ]};
        pool_out[8 ][1 ] <= |{pool_in[16][2 ], pool_in[16][3 ], pool_in[17][2 ], pool_in[17][3 ]};
        pool_out[8 ][2 ] <= |{pool_in[16][4 ], pool_in[16][5 ], pool_in[17][4 ], pool_in[17][5 ]};
        pool_out[8 ][3 ] <= |{pool_in[16][6 ], pool_in[16][7 ], pool_in[17][6 ], pool_in[17][7 ]};
        pool_out[8 ][4 ] <= |{pool_in[16][8 ], pool_in[16][9 ], pool_in[17][8 ], pool_in[17][9 ]};
        pool_out[8 ][5 ] <= |{pool_in[16][10], pool_in[16][11], pool_in[17][10], pool_in[17][11]};
        pool_out[8 ][6 ] <= |{pool_in[16][12], pool_in[16][13], pool_in[17][12], pool_in[17][13]};
        pool_out[8 ][7 ] <= |{pool_in[16][14], pool_in[16][15], pool_in[17][14], pool_in[17][15]};
        pool_out[8 ][8 ] <= |{pool_in[16][16], pool_in[16][17], pool_in[17][16], pool_in[17][17]};
        pool_out[8 ][9 ] <= |{pool_in[16][18], pool_in[16][19], pool_in[17][18], pool_in[17][19]};
        pool_out[8 ][10] <= |{pool_in[16][20], pool_in[16][21], pool_in[17][20], pool_in[17][21]};
        pool_out[8 ][11] <= |{pool_in[16][22], pool_in[16][23], pool_in[17][22], pool_in[17][23]};

        pool_out[9 ][0 ] <= |{pool_in[18][0 ], pool_in[18][1 ], pool_in[19][0 ], pool_in[19][1 ]};
        pool_out[9 ][1 ] <= |{pool_in[18][2 ], pool_in[18][3 ], pool_in[19][2 ], pool_in[19][3 ]};
        pool_out[9 ][2 ] <= |{pool_in[18][4 ], pool_in[18][5 ], pool_in[19][4 ], pool_in[19][5 ]};
        pool_out[9 ][3 ] <= |{pool_in[18][6 ], pool_in[18][7 ], pool_in[19][6 ], pool_in[19][7 ]};
        pool_out[9 ][4 ] <= |{pool_in[18][8 ], pool_in[18][9 ], pool_in[19][8 ], pool_in[19][9 ]};
        pool_out[9 ][5 ] <= |{pool_in[18][10], pool_in[18][11], pool_in[19][10], pool_in[19][11]};
        pool_out[9 ][6 ] <= |{pool_in[18][12], pool_in[18][13], pool_in[19][12], pool_in[19][13]};
        pool_out[9 ][7 ] <= |{pool_in[18][14], pool_in[18][15], pool_in[19][14], pool_in[19][15]};
        pool_out[9 ][8 ] <= |{pool_in[18][16], pool_in[18][17], pool_in[19][16], pool_in[19][17]};
        pool_out[9 ][9 ] <= |{pool_in[18][18], pool_in[18][19], pool_in[19][18], pool_in[19][19]};
        pool_out[9 ][10] <= |{pool_in[18][20], pool_in[18][21], pool_in[19][20], pool_in[19][21]};
        pool_out[9 ][11] <= |{pool_in[18][22], pool_in[18][23], pool_in[19][22], pool_in[19][23]};

        pool_out[10][0 ] <= |{pool_in[20][0 ], pool_in[20][1 ], pool_in[21][0 ], pool_in[21][1 ]};
        pool_out[10][1 ] <= |{pool_in[20][2 ], pool_in[20][3 ], pool_in[21][2 ], pool_in[21][3 ]};
        pool_out[10][2 ] <= |{pool_in[20][4 ], pool_in[20][5 ], pool_in[21][4 ], pool_in[21][5 ]};
        pool_out[10][3 ] <= |{pool_in[20][6 ], pool_in[20][7 ], pool_in[21][6 ], pool_in[21][7 ]};
        pool_out[10][4 ] <= |{pool_in[20][8 ], pool_in[20][9 ], pool_in[21][8 ], pool_in[21][9 ]};
        pool_out[10][5 ] <= |{pool_in[20][10], pool_in[20][11], pool_in[21][10], pool_in[21][11]};
        pool_out[10][6 ] <= |{pool_in[20][12], pool_in[20][13], pool_in[21][12], pool_in[21][13]};
        pool_out[10][7 ] <= |{pool_in[20][14], pool_in[20][15], pool_in[21][14], pool_in[21][15]};
        pool_out[10][8 ] <= |{pool_in[20][16], pool_in[20][17], pool_in[21][16], pool_in[21][17]};
        pool_out[10][9 ] <= |{pool_in[20][18], pool_in[20][19], pool_in[21][18], pool_in[21][19]};
        pool_out[10][10] <= |{pool_in[20][20], pool_in[20][21], pool_in[21][20], pool_in[21][21]};
        pool_out[10][11] <= |{pool_in[20][22], pool_in[20][23], pool_in[21][22], pool_in[21][23]};

        pool_out[11][0 ] <= |{pool_in[22][0 ], pool_in[22][1 ], pool_in[23][0 ], pool_in[23][1 ]};
        pool_out[11][1 ] <= |{pool_in[22][2 ], pool_in[22][3 ], pool_in[23][2 ], pool_in[23][3 ]};
        pool_out[11][2 ] <= |{pool_in[22][4 ], pool_in[22][5 ], pool_in[23][4 ], pool_in[23][5 ]};
        pool_out[11][3 ] <= |{pool_in[22][6 ], pool_in[22][7 ], pool_in[23][6 ], pool_in[23][7 ]};
        pool_out[11][4 ] <= |{pool_in[22][8 ], pool_in[22][9 ], pool_in[23][8 ], pool_in[23][9 ]};
        pool_out[11][5 ] <= |{pool_in[22][10], pool_in[22][11], pool_in[23][10], pool_in[23][11]};
        pool_out[11][6 ] <= |{pool_in[22][12], pool_in[22][13], pool_in[23][12], pool_in[23][13]};
        pool_out[11][7 ] <= |{pool_in[22][14], pool_in[22][15], pool_in[23][14], pool_in[23][15]};
        pool_out[11][8 ] <= |{pool_in[22][16], pool_in[22][17], pool_in[23][16], pool_in[23][17]};
        pool_out[11][9 ] <= |{pool_in[22][18], pool_in[22][19], pool_in[23][18], pool_in[23][19]};
        pool_out[11][10] <= |{pool_in[22][20], pool_in[22][21], pool_in[23][20], pool_in[23][21]};
        pool_out[11][11] <= |{pool_in[22][22], pool_in[22][23], pool_in[23][22], pool_in[23][23]};

    end
end

for (i=0; i<12; i=i+1) begin
    for (j=0; j<12; j=j+1) begin
        assign o_pool_out[i*12 + j] = pool_out[i][j];
    end
end


endmodule