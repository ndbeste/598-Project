module pool2_1 (
    input  logic pool_in [0:24][0:24],
    output logic pool_out[0:12][0:12]
);



 
assign pool_out[0 ][ 0] = ~&{pool_in[0 ][ 0][0], pool_in[0 ][ 1][0], pool_in[1 ][ 0][0], pool_in[1 ][ 1][0]};
assign pool_out[0 ][ 1] = ~&{pool_in[0 ][ 2][0], pool_in[0 ][ 3][0], pool_in[1 ][ 2][0], pool_in[1 ][ 3][0]};
assign pool_out[0 ][ 2] = ~&{pool_in[0 ][ 4][0], pool_in[0 ][ 5][0], pool_in[1 ][ 4][0], pool_in[1 ][ 5][0]};
assign pool_out[0 ][ 3] = ~&{pool_in[0 ][ 6][0], pool_in[0 ][ 7][0], pool_in[1 ][ 6][0], pool_in[1 ][ 7][0]};
assign pool_out[0 ][ 4] = ~&{pool_in[0 ][ 8][0], pool_in[0 ][ 9][0], pool_in[1 ][ 8][0], pool_in[1 ][ 9][0]};
assign pool_out[0 ][ 5] = ~&{pool_in[0 ][10][0], pool_in[0 ][11][0], pool_in[1 ][10][0], pool_in[1 ][11][0]};
assign pool_out[0 ][ 6] = ~&{pool_in[0 ][12][0], pool_in[0 ][13][0], pool_in[1 ][12][0], pool_in[1 ][13][0]};
assign pool_out[0 ][ 7] = ~&{pool_in[0 ][14][0], pool_in[0 ][15][0], pool_in[1 ][14][0], pool_in[1 ][15][0]};
assign pool_out[0 ][ 8] = ~&{pool_in[0 ][16][0], pool_in[0 ][17][0], pool_in[1 ][16][0], pool_in[1 ][17][0]};
assign pool_out[0 ][ 9] = ~&{pool_in[0 ][18][0], pool_in[0 ][19][0], pool_in[1 ][18][0], pool_in[1 ][19][0]};
assign pool_out[0 ][10] = ~&{pool_in[0 ][20][0], pool_in[0 ][21][0], pool_in[1 ][20][0], pool_in[1 ][21][0]};
assign pool_out[0 ][11] = ~&{pool_in[0 ][22][0], pool_in[0 ][23][0], pool_in[1 ][22][0], pool_in[1 ][23][0]};

assign pool_out[1 ][ 0] = ~&{pool_in[2 ][ 0][0], pool_in[2 ][ 1][0], pool_in[3 ][ 0][0], pool_in[3 ][ 1][0]};
assign pool_out[1 ][ 1] = ~&{pool_in[2 ][ 2][0], pool_in[2 ][ 3][0], pool_in[3 ][ 2][0], pool_in[3 ][ 3][0]};
assign pool_out[1 ][ 2] = ~&{pool_in[2 ][ 4][0], pool_in[2 ][ 5][0], pool_in[3 ][ 4][0], pool_in[3 ][ 5][0]};
assign pool_out[1 ][ 3] = ~&{pool_in[2 ][ 6][0], pool_in[2 ][ 7][0], pool_in[3 ][ 6][0], pool_in[3 ][ 7][0]};
assign pool_out[1 ][ 4] = ~&{pool_in[2 ][ 8][0], pool_in[2 ][ 9][0], pool_in[3 ][ 8][0], pool_in[3 ][ 9][0]};
assign pool_out[1 ][ 5] = ~&{pool_in[2 ][10][0], pool_in[2 ][11][0], pool_in[3 ][10][0], pool_in[3 ][11][0]};
assign pool_out[1 ][ 6] = ~&{pool_in[2 ][12][0], pool_in[2 ][13][0], pool_in[3 ][12][0], pool_in[3 ][13][0]};
assign pool_out[1 ][ 7] = ~&{pool_in[2 ][14][0], pool_in[2 ][15][0], pool_in[3 ][14][0], pool_in[3 ][15][0]};
assign pool_out[1 ][ 8] = ~&{pool_in[2 ][16][0], pool_in[2 ][17][0], pool_in[3 ][16][0], pool_in[3 ][17][0]};
assign pool_out[1 ][ 9] = ~&{pool_in[2 ][18][0], pool_in[2 ][19][0], pool_in[3 ][18][0], pool_in[3 ][19][0]};
assign pool_out[1 ][10] = ~&{pool_in[2 ][20][0], pool_in[2 ][21][0], pool_in[3 ][20][0], pool_in[3 ][21][0]};
assign pool_out[1 ][11] = ~&{pool_in[2 ][22][0], pool_in[2 ][23][0], pool_in[3 ][22][0], pool_in[3 ][23][0]};

assign pool_out[2 ][ 0] = ~&{pool_in[4 ][ 0][0], pool_in[4 ][ 1][0], pool_in[5 ][ 0][0], pool_in[5 ][ 1][0]};
assign pool_out[2 ][ 1] = ~&{pool_in[4 ][ 2][0], pool_in[4 ][ 3][0], pool_in[5 ][ 2][0], pool_in[5 ][ 3][0]};
assign pool_out[2 ][ 2] = ~&{pool_in[4 ][ 4][0], pool_in[4 ][ 5][0], pool_in[5 ][ 4][0], pool_in[5 ][ 5][0]};
assign pool_out[2 ][ 3] = ~&{pool_in[4 ][ 6][0], pool_in[4 ][ 7][0], pool_in[5 ][ 6][0], pool_in[5 ][ 7][0]};
assign pool_out[2 ][ 4] = ~&{pool_in[4 ][ 8][0], pool_in[4 ][ 9][0], pool_in[5 ][ 8][0], pool_in[5 ][ 9][0]};
assign pool_out[2 ][ 5] = ~&{pool_in[4 ][10][0], pool_in[4 ][11][0], pool_in[5 ][10][0], pool_in[5 ][11][0]};
assign pool_out[2 ][ 6] = ~&{pool_in[4 ][12][0], pool_in[4 ][13][0], pool_in[5 ][12][0], pool_in[5 ][13][0]};
assign pool_out[2 ][ 7] = ~&{pool_in[4 ][14][0], pool_in[4 ][15][0], pool_in[5 ][14][0], pool_in[5 ][15][0]};
assign pool_out[2 ][ 8] = ~&{pool_in[4 ][16][0], pool_in[4 ][17][0], pool_in[5 ][16][0], pool_in[5 ][17][0]};
assign pool_out[2 ][ 9] = ~&{pool_in[4 ][18][0], pool_in[4 ][19][0], pool_in[5 ][18][0], pool_in[5 ][19][0]};
assign pool_out[2 ][10] = ~&{pool_in[4 ][20][0], pool_in[4 ][21][0], pool_in[5 ][20][0], pool_in[5 ][21][0]};
assign pool_out[2 ][11] = ~&{pool_in[4 ][22][0], pool_in[4 ][23][0], pool_in[5 ][22][0], pool_in[5 ][23][0]};

assign pool_out[3 ][ 0] = ~&{pool_in[6 ][ 0][0], pool_in[6 ][ 1][0], pool_in[7 ][ 0][0], pool_in[7 ][ 1][0]};
assign pool_out[3 ][ 1] = ~&{pool_in[6 ][ 2][0], pool_in[6 ][ 3][0], pool_in[7 ][ 2][0], pool_in[7 ][ 3][0]};
assign pool_out[3 ][ 2] = ~&{pool_in[6 ][ 4][0], pool_in[6 ][ 5][0], pool_in[7 ][ 4][0], pool_in[7 ][ 5][0]};
assign pool_out[3 ][ 3] = ~&{pool_in[6 ][ 6][0], pool_in[6 ][ 7][0], pool_in[7 ][ 6][0], pool_in[7 ][ 7][0]};
assign pool_out[3 ][ 4] = ~&{pool_in[6 ][ 8][0], pool_in[6 ][ 9][0], pool_in[7 ][ 8][0], pool_in[7 ][ 9][0]};
assign pool_out[3 ][ 5] = ~&{pool_in[6 ][10][0], pool_in[6 ][11][0], pool_in[7 ][10][0], pool_in[7 ][11][0]};
assign pool_out[3 ][ 6] = ~&{pool_in[6 ][12][0], pool_in[6 ][13][0], pool_in[7 ][12][0], pool_in[7 ][13][0]};
assign pool_out[3 ][ 7] = ~&{pool_in[6 ][14][0], pool_in[6 ][15][0], pool_in[7 ][14][0], pool_in[7 ][15][0]};
assign pool_out[3 ][ 8] = ~&{pool_in[6 ][16][0], pool_in[6 ][17][0], pool_in[7 ][16][0], pool_in[7 ][17][0]};
assign pool_out[3 ][ 9] = ~&{pool_in[6 ][18][0], pool_in[6 ][19][0], pool_in[7 ][18][0], pool_in[7 ][19][0]};
assign pool_out[3 ][10] = ~&{pool_in[6 ][20][0], pool_in[6 ][21][0], pool_in[7 ][20][0], pool_in[7 ][21][0]};
assign pool_out[3 ][11] = ~&{pool_in[6 ][22][0], pool_in[6 ][23][0], pool_in[7 ][22][0], pool_in[7 ][23][0]};

assign pool_out[4 ][ 0] = ~&{pool_in[8 ][ 0][0], pool_in[8 ][ 1][0], pool_in[9 ][ 0][0], pool_in[9 ][ 1][0]};
assign pool_out[4 ][ 1] = ~&{pool_in[8 ][ 2][0], pool_in[8 ][ 3][0], pool_in[9 ][ 2][0], pool_in[9 ][ 3][0]};
assign pool_out[4 ][ 2] = ~&{pool_in[8 ][ 4][0], pool_in[8 ][ 5][0], pool_in[9 ][ 4][0], pool_in[9 ][ 5][0]};
assign pool_out[4 ][ 3] = ~&{pool_in[8 ][ 6][0], pool_in[8 ][ 7][0], pool_in[9 ][ 6][0], pool_in[9 ][ 7][0]};
assign pool_out[4 ][ 4] = ~&{pool_in[8 ][ 8][0], pool_in[8 ][ 9][0], pool_in[9 ][ 8][0], pool_in[9 ][ 9][0]};
assign pool_out[4 ][ 5] = ~&{pool_in[8 ][10][0], pool_in[8 ][11][0], pool_in[9 ][10][0], pool_in[9 ][11][0]};
assign pool_out[4 ][ 6] = ~&{pool_in[8 ][12][0], pool_in[8 ][13][0], pool_in[9 ][12][0], pool_in[9 ][13][0]};
assign pool_out[4 ][ 7] = ~&{pool_in[8 ][14][0], pool_in[8 ][15][0], pool_in[9 ][14][0], pool_in[9 ][15][0]};
assign pool_out[4 ][ 8] = ~&{pool_in[8 ][16][0], pool_in[8 ][17][0], pool_in[9 ][16][0], pool_in[9 ][17][0]};
assign pool_out[4 ][ 9] = ~&{pool_in[8 ][18][0], pool_in[8 ][19][0], pool_in[9 ][18][0], pool_in[9 ][19][0]};
assign pool_out[4 ][10] = ~&{pool_in[8 ][20][0], pool_in[8 ][21][0], pool_in[9 ][20][0], pool_in[9 ][21][0]};
assign pool_out[4 ][11] = ~&{pool_in[8 ][22][0], pool_in[8 ][23][0], pool_in[9 ][22][0], pool_in[9 ][23][0]};

assign pool_out[5 ][ 0] = ~&{pool_in[10][ 0][0], pool_in[10][ 1][0], pool_in[11][ 0][0], pool_in[11][ 1][0]};
assign pool_out[5 ][ 1] = ~&{pool_in[10][ 2][0], pool_in[10][ 3][0], pool_in[11][ 2][0], pool_in[11][ 3][0]};
assign pool_out[5 ][ 2] = ~&{pool_in[10][ 4][0], pool_in[10][ 5][0], pool_in[11][ 4][0], pool_in[11][ 5][0]};
assign pool_out[5 ][ 3] = ~&{pool_in[10][ 6][0], pool_in[10][ 7][0], pool_in[11][ 6][0], pool_in[11][ 7][0]};
assign pool_out[5 ][ 4] = ~&{pool_in[10][ 8][0], pool_in[10][ 9][0], pool_in[11][ 8][0], pool_in[11][ 9][0]};
assign pool_out[5 ][ 5] = ~&{pool_in[10][10][0], pool_in[10][11][0], pool_in[11][10][0], pool_in[11][11][0]};
assign pool_out[5 ][ 6] = ~&{pool_in[10][12][0], pool_in[10][13][0], pool_in[11][12][0], pool_in[11][13][0]};
assign pool_out[5 ][ 7] = ~&{pool_in[10][14][0], pool_in[10][15][0], pool_in[11][14][0], pool_in[11][15][0]};
assign pool_out[5 ][ 8] = ~&{pool_in[10][16][0], pool_in[10][17][0], pool_in[11][16][0], pool_in[11][17][0]};
assign pool_out[5 ][ 9] = ~&{pool_in[10][18][0], pool_in[10][19][0], pool_in[11][18][0], pool_in[11][19][0]};
assign pool_out[5 ][10] = ~&{pool_in[10][20][0], pool_in[10][21][0], pool_in[11][20][0], pool_in[11][21][0]};
assign pool_out[5 ][11] = ~&{pool_in[10][22][0], pool_in[10][23][0], pool_in[11][22][0], pool_in[11][23][0]};

assign pool_out[6 ][ 0] = ~&{pool_in[12][ 0][0], pool_in[12][ 1][0], pool_in[13][ 0][0], pool_in[13][ 1][0]};
assign pool_out[6 ][ 1] = ~&{pool_in[12][ 2][0], pool_in[12][ 3][0], pool_in[13][ 2][0], pool_in[13][ 3][0]};
assign pool_out[6 ][ 2] = ~&{pool_in[12][ 4][0], pool_in[12][ 5][0], pool_in[13][ 4][0], pool_in[13][ 5][0]};
assign pool_out[6 ][ 3] = ~&{pool_in[12][ 6][0], pool_in[12][ 7][0], pool_in[13][ 6][0], pool_in[13][ 7][0]};
assign pool_out[6 ][ 4] = ~&{pool_in[12][ 8][0], pool_in[12][ 9][0], pool_in[13][ 8][0], pool_in[13][ 9][0]};
assign pool_out[6 ][ 5] = ~&{pool_in[12][10][0], pool_in[12][11][0], pool_in[13][10][0], pool_in[13][11][0]};
assign pool_out[6 ][ 6] = ~&{pool_in[12][12][0], pool_in[12][13][0], pool_in[13][12][0], pool_in[13][13][0]};
assign pool_out[6 ][ 7] = ~&{pool_in[12][14][0], pool_in[12][15][0], pool_in[13][14][0], pool_in[13][15][0]};
assign pool_out[6 ][ 8] = ~&{pool_in[12][16][0], pool_in[12][17][0], pool_in[13][16][0], pool_in[13][17][0]};
assign pool_out[6 ][ 9] = ~&{pool_in[12][18][0], pool_in[12][19][0], pool_in[13][18][0], pool_in[13][19][0]};
assign pool_out[6 ][10] = ~&{pool_in[12][20][0], pool_in[12][21][0], pool_in[13][20][0], pool_in[13][21][0]};
assign pool_out[6 ][11] = ~&{pool_in[12][22][0], pool_in[12][23][0], pool_in[13][22][0], pool_in[13][23][0]};

assign pool_out[7 ][ 0] = ~&{pool_in[14][ 0][0], pool_in[14][ 1][0], pool_in[15][ 0][0], pool_in[15][ 1][0]};
assign pool_out[7 ][ 1] = ~&{pool_in[14][ 2][0], pool_in[14][ 3][0], pool_in[15][ 2][0], pool_in[15][ 3][0]};
assign pool_out[7 ][ 2] = ~&{pool_in[14][ 4][0], pool_in[14][ 5][0], pool_in[15][ 4][0], pool_in[15][ 5][0]};
assign pool_out[7 ][ 3] = ~&{pool_in[14][ 6][0], pool_in[14][ 7][0], pool_in[15][ 6][0], pool_in[15][ 7][0]};
assign pool_out[7 ][ 4] = ~&{pool_in[14][ 8][0], pool_in[14][ 9][0], pool_in[15][ 8][0], pool_in[15][ 9][0]};
assign pool_out[7 ][ 5] = ~&{pool_in[14][10][0], pool_in[14][11][0], pool_in[15][10][0], pool_in[15][11][0]};
assign pool_out[7 ][ 6] = ~&{pool_in[14][12][0], pool_in[14][13][0], pool_in[15][12][0], pool_in[15][13][0]};
assign pool_out[7 ][ 7] = ~&{pool_in[14][14][0], pool_in[14][15][0], pool_in[15][14][0], pool_in[15][15][0]};
assign pool_out[7 ][ 8] = ~&{pool_in[14][16][0], pool_in[14][17][0], pool_in[15][16][0], pool_in[15][17][0]};
assign pool_out[7 ][ 9] = ~&{pool_in[14][18][0], pool_in[14][19][0], pool_in[15][18][0], pool_in[15][19][0]};
assign pool_out[7 ][10] = ~&{pool_in[14][20][0], pool_in[14][21][0], pool_in[15][20][0], pool_in[15][21][0]};
assign pool_out[7 ][11] = ~&{pool_in[14][22][0], pool_in[14][23][0], pool_in[15][22][0], pool_in[15][23][0]};

assign pool_out[8 ][ 0] = ~&{pool_in[16][ 0][0], pool_in[16][ 1][0], pool_in[17][ 0][0], pool_in[17][ 1][0]};
assign pool_out[8 ][ 1] = ~&{pool_in[16][ 2][0], pool_in[16][ 3][0], pool_in[17][ 2][0], pool_in[17][ 3][0]};
assign pool_out[8 ][ 2] = ~&{pool_in[16][ 4][0], pool_in[16][ 5][0], pool_in[17][ 4][0], pool_in[17][ 5][0]};
assign pool_out[8 ][ 3] = ~&{pool_in[16][ 6][0], pool_in[16][ 7][0], pool_in[17][ 6][0], pool_in[17][ 7][0]};
assign pool_out[8 ][ 4] = ~&{pool_in[16][ 8][0], pool_in[16][ 9][0], pool_in[17][ 8][0], pool_in[17][ 9][0]};
assign pool_out[8 ][ 5] = ~&{pool_in[16][10][0], pool_in[16][11][0], pool_in[17][10][0], pool_in[17][11][0]};
assign pool_out[8 ][ 6] = ~&{pool_in[16][12][0], pool_in[16][13][0], pool_in[17][12][0], pool_in[17][13][0]};
assign pool_out[8 ][ 7] = ~&{pool_in[16][14][0], pool_in[16][15][0], pool_in[17][14][0], pool_in[17][15][0]};
assign pool_out[8 ][ 8] = ~&{pool_in[16][16][0], pool_in[16][17][0], pool_in[17][16][0], pool_in[17][17][0]};
assign pool_out[8 ][ 9] = ~&{pool_in[16][18][0], pool_in[16][19][0], pool_in[17][18][0], pool_in[17][19][0]};
assign pool_out[8 ][10] = ~&{pool_in[16][20][0], pool_in[16][21][0], pool_in[17][20][0], pool_in[17][21][0]};
assign pool_out[8 ][11] = ~&{pool_in[16][22][0], pool_in[16][23][0], pool_in[17][22][0], pool_in[17][23][0]};

assign pool_out[9 ][ 0] = ~&{pool_in[18][ 0][0], pool_in[18][ 1][0], pool_in[19][ 0][0], pool_in[19][ 1][0]};
assign pool_out[9 ][ 1] = ~&{pool_in[18][ 2][0], pool_in[18][ 3][0], pool_in[19][ 2][0], pool_in[19][ 3][0]};
assign pool_out[9 ][ 2] = ~&{pool_in[18][ 4][0], pool_in[18][ 5][0], pool_in[19][ 4][0], pool_in[19][ 5][0]};
assign pool_out[9 ][ 3] = ~&{pool_in[18][ 6][0], pool_in[18][ 7][0], pool_in[19][ 6][0], pool_in[19][ 7][0]};
assign pool_out[9 ][ 4] = ~&{pool_in[18][ 8][0], pool_in[18][ 9][0], pool_in[19][ 8][0], pool_in[19][ 9][0]};
assign pool_out[9 ][ 5] = ~&{pool_in[18][10][0], pool_in[18][11][0], pool_in[19][10][0], pool_in[19][11][0]};
assign pool_out[9 ][ 6] = ~&{pool_in[18][12][0], pool_in[18][13][0], pool_in[19][12][0], pool_in[19][13][0]};
assign pool_out[9 ][ 7] = ~&{pool_in[18][14][0], pool_in[18][15][0], pool_in[19][14][0], pool_in[19][15][0]};
assign pool_out[9 ][ 8] = ~&{pool_in[18][16][0], pool_in[18][17][0], pool_in[19][16][0], pool_in[19][17][0]};
assign pool_out[9 ][ 9] = ~&{pool_in[18][18][0], pool_in[18][19][0], pool_in[19][18][0], pool_in[19][19][0]};
assign pool_out[9 ][10] = ~&{pool_in[18][20][0], pool_in[18][21][0], pool_in[19][20][0], pool_in[19][21][0]};
assign pool_out[9 ][11] = ~&{pool_in[18][22][0], pool_in[18][23][0], pool_in[19][22][0], pool_in[19][23][0]};

assign pool_out[10][ 0] = ~&{pool_in[20][ 0][0], pool_in[20][ 1][0], pool_in[21][ 0][0], pool_in[21][ 1][0]};
assign pool_out[10][ 1] = ~&{pool_in[20][ 2][0], pool_in[20][ 3][0], pool_in[21][ 2][0], pool_in[21][ 3][0]};
assign pool_out[10][ 2] = ~&{pool_in[20][ 4][0], pool_in[20][ 5][0], pool_in[21][ 4][0], pool_in[21][ 5][0]};
assign pool_out[10][ 3] = ~&{pool_in[20][ 6][0], pool_in[20][ 7][0], pool_in[21][ 6][0], pool_in[21][ 7][0]};
assign pool_out[10][ 4] = ~&{pool_in[20][ 8][0], pool_in[20][ 9][0], pool_in[21][ 8][0], pool_in[21][ 9][0]};
assign pool_out[10][ 5] = ~&{pool_in[20][10][0], pool_in[20][11][0], pool_in[21][10][0], pool_in[21][11][0]};
assign pool_out[10][ 6] = ~&{pool_in[20][12][0], pool_in[20][13][0], pool_in[21][12][0], pool_in[21][13][0]};
assign pool_out[10][ 7] = ~&{pool_in[20][14][0], pool_in[20][15][0], pool_in[21][14][0], pool_in[21][15][0]};
assign pool_out[10][ 8] = ~&{pool_in[20][16][0], pool_in[20][17][0], pool_in[21][16][0], pool_in[21][17][0]};
assign pool_out[10][ 9] = ~&{pool_in[20][18][0], pool_in[20][19][0], pool_in[21][18][0], pool_in[21][19][0]};
assign pool_out[10][10] = ~&{pool_in[20][20][0], pool_in[20][21][0], pool_in[21][20][0], pool_in[21][21][0]};
assign pool_out[10][11] = ~&{pool_in[20][22][0], pool_in[20][23][0], pool_in[21][22][0], pool_in[21][23][0]};

assign pool_out[11][ 0] = ~&{pool_in[22][ 0][0], pool_in[22][ 1][0], pool_in[23][ 0][0], pool_in[23][ 1][0]};
assign pool_out[11][ 1] = ~&{pool_in[22][ 2][0], pool_in[22][ 3][0], pool_in[23][ 2][0], pool_in[23][ 3][0]};
assign pool_out[11][ 2] = ~&{pool_in[22][ 4][0], pool_in[22][ 5][0], pool_in[23][ 4][0], pool_in[23][ 5][0]};
assign pool_out[11][ 3] = ~&{pool_in[22][ 6][0], pool_in[22][ 7][0], pool_in[23][ 6][0], pool_in[23][ 7][0]};
assign pool_out[11][ 4] = ~&{pool_in[22][ 8][0], pool_in[22][ 9][0], pool_in[23][ 8][0], pool_in[23][ 9][0]};
assign pool_out[11][ 5] = ~&{pool_in[22][10][0], pool_in[22][11][0], pool_in[23][10][0], pool_in[23][11][0]};
assign pool_out[11][ 6] = ~&{pool_in[22][12][0], pool_in[22][13][0], pool_in[23][12][0], pool_in[23][13][0]};
assign pool_out[11][ 7] = ~&{pool_in[22][14][0], pool_in[22][15][0], pool_in[23][14][0], pool_in[23][15][0]};
assign pool_out[11][ 8] = ~&{pool_in[22][16][0], pool_in[22][17][0], pool_in[23][16][0], pool_in[23][17][0]};
assign pool_out[11][ 9] = ~&{pool_in[22][18][0], pool_in[22][19][0], pool_in[23][18][0], pool_in[23][19][0]};
assign pool_out[11][10] = ~&{pool_in[22][20][0], pool_in[22][21][0], pool_in[23][20][0], pool_in[23][21][0]};
assign pool_out[11][11] = ~&{pool_in[22][22][0], pool_in[22][23][0], pool_in[23][22][0], pool_in[23][23][0]};

endmodule