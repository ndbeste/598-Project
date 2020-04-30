module conv_pool_pixel125
#(parameter chan = 5,
parameter bW = 7)
(
input logic image[0:5][0:5],
input logic kernels[0:chan-1][0:5-1][0:5-1],
input logic [bW-1:0] offset,
output logic pixel);


logic [chan*5*5-1:0] image_slice1;
assign image_slice1 = {chan{image[0][0],image[0][1],image[0][2],image[0][3],image[0][4],image[1][0],image[1][1],image[1][2],image[1][3],image[1][4],image[2][0],image[2][1],
             image[2][2],image[2][3],image[2][4],image[3][0],image[3][1],image[3][2],image[3][3],image[3][4],image[4][0],image[4][1],image[4][2],image[4][3],image[4][4]}};
logic [chan*5*5-1:0] image_slice2;
assign image_slice2 = {chan{image[1][0],image[1][1],image[1][2],image[1][3],image[1][4],image[2][0],image[2][1],image[2][2],image[2][3],image[2][4],image[3][0],image[3][1],
             image[3][2],image[3][3],image[3][4],image[4][0],image[4][1],image[4][2],image[4][3],image[4][4],image[5][0],image[5][1],image[5][2],image[5][3],image[5][4]}};
logic [chan*5*5-1:0] image_slice3;
assign image_slice3 = {chan{image[0][1],image[0][2],image[0][3],image[0][4],image[0][5],image[1][1],image[1][2],image[1][3],image[1][4],image[1][5],image[2][1],image[2][2],
             image[2][3],image[2][4],image[2][5],image[3][1],image[3][2],image[3][3],image[3][4],image[3][5],image[4][1],image[4][2],image[4][3],image[4][4],image[4][5]}};
logic [chan*5*5-1:0] image_slice4;
assign image_slice4 = {chan{image[1][1],image[1][2],image[1][3],image[1][4],image[1][5],image[2][1],image[2][2],image[2][3],image[2][4],image[2][5],image[3][1],image[3][2],
             image[3][3],image[3][4],image[3][5],image[4][1],image[4][2],image[4][3],image[4][4],image[4][5],image[5][1],image[5][2],image[5][3],image[5][4],image[5][5]}};


logic [0:chan*5*5-1] kernel_slice;
assign kernel_slice = {kernels[0][0][0],kernels[0][0][1],kernels[0][0][2],kernels[0][0][3],kernels[0][0][4],kernels[0][1][0],kernels[0][1][1],kernels[0][1][2],kernels[0][1][3],kernels[0][1][4],kernels[0][2][0],kernels[0][2][1],kernels[0][2][2],kernels[0][2][3],kernels[0][2][4],kernels[0][3][0],kernels[0][3][1],kernels[0][3][2],kernels[0][3][3],kernels[0][3][4],kernels[0][4][0],kernels[0][4][1],kernels[0][4][2],kernels[0][4][3],kernels[0][4][4],kernels[1][0][0],kernels[1][0][1],kernels[1][0][2],kernels[1][0][3],kernels[1][0][4],kernels[1][1][0],kernels[1][1][1],kernels[1][1][2],kernels[1][1][3],kernels[1][1][4],kernels[1][2][0],kernels[1][2][1],kernels[1][2][2],kernels[1][2][3],kernels[1][2][4],kernels[1][3][0],kernels[1][3][1],kernels[1][3][2],kernels[1][3][3],kernels[1][3][4],kernels[1][4][0],kernels[1][4][1],kernels[1][4][2],kernels[1][4][3],kernels[1][4][4],kernels[2][0][0],kernels[2][0][1],kernels[2][0][2],kernels[2][0][3],kernels[2][0][4],kernels[2][1][0],kernels[2][1][1],kernels[2][1][2],kernels[2][1][3],kernels[2][1][4],kernels[2][2][0],kernels[2][2][1],kernels[2][2][2],kernels[2][2][3],kernels[2][2][4],kernels[2][3][0],kernels[2][3][1],kernels[2][3][2],kernels[2][3][3],kernels[2][3][4],kernels[2][4][0],kernels[2][4][1],kernels[2][4][2],kernels[2][4][3],kernels[2][4][4],kernels[3][0][0],kernels[3][0][1],kernels[3][0][2],kernels[3][0][3],kernels[3][0][4],kernels[3][1][0],kernels[3][1][1],kernels[3][1][2],kernels[3][1][3],kernels[3][1][4],kernels[3][2][0],kernels[3][2][1],kernels[3][2][2],kernels[3][2][3],kernels[3][2][4],kernels[3][3][0],kernels[3][3][1],kernels[3][3][2],kernels[3][3][3],kernels[3][3][4],kernels[3][4][0],kernels[3][4][1],kernels[3][4][2],kernels[3][4][3],kernels[3][4][4],kernels[4][0][0],kernels[4][0][1],kernels[4][0][2],kernels[4][0][3],kernels[4][0][4],kernels[4][1][0],kernels[4][1][1],kernels[4][1][2],kernels[4][1][3],kernels[4][1][4],kernels[4][2][0],kernels[4][2][1],kernels[4][2][2],kernels[4][2][3],kernels[4][2][4],kernels[4][3][0],kernels[4][3][1],kernels[4][3][2],kernels[4][3][3],kernels[4][3][4],kernels[4][4][0],kernels[4][4][1],kernels[4][4][2],kernels[4][4][3],kernels[4][4][4]};

logic [0:chan*5*5-1] xnor1, xnor2, xnor3, xnor4;
assign xnor1 = image_slice1 ~^ kernel_slice;
assign xnor2 = image_slice2 ~^ kernel_slice;
assign xnor3 = image_slice3 ~^ kernel_slice;
assign xnor4 = image_slice4 ~^ kernel_slice;

logic [bW-1:0] sum1;
logic [bW-1:0] sum2;
logic [bW-1:0] sum3;
logic [bW-1:0] sum4;

popadd125 p1 (.bits(xnor1), .cnt(sum1));
popadd125 p2 (.bits(xnor2), .cnt(sum2));
popadd125 p3 (.bits(xnor3), .cnt(sum3));
popadd125 p4 (.bits(xnor4), .cnt(sum4));

logic bin1, bin2, bin3, bin4;

assign bin1 = sum1 > offset;
assign bin2 = sum2 > offset;
assign bin3 = sum3 > offset;
assign bin4 = sum4 > offset;

assign pixel = bin1 | bin2 | bin3 | bin4;


endmodule
