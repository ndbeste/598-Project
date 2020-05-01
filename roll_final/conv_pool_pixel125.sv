module conv_pool_pixel125
#(parameter chan = 5,
parameter bW = 7)
(
input logic image[0:6*6-1],
input logic kernels[0:chan*5*5-1],
input logic [bW-1:0] offset,
output logic pixel);


logic [chan*5*5-1:0] image_slice1;
assign image_slice1 = {chan{image[0*6+0],image[0*6+1],image[0*6+2],image[0*6+3],image[0*6+4],image[1*6+0],image[1*6+1],image[1*6+2],image[1*6+3],image[1*6+4],image[2*6+0],image[2*6+1],image[2*6+2],image[2*6+3],image[2*6+4],image[3*6+0],image[3*6+1],image[3*6+2],image[3*6+3],image[3*6+4],image[4*6+0],image[4*6+1],image[4*6+2],image[4*6+3],image[4*6+4]}};
logic [chan*5*5-1:0] image_slice2;
assign image_slice2 = {chan{image[1*6+0],image[1*6+1],image[1*6+2],image[1*6+3],image[1*6+4],image[2*6+0],image[2*6+1],image[2*6+2],image[2*6+3],image[2*6+4],image[3*6+0],image[3*6+1],image[3*6+2],image[3*6+3],image[3*6+4],image[4*6+0],image[4*6+1],image[4*6+2],image[4*6+3],image[4*6+4],image[5*6+0],image[5*6+1],image[5*6+2],image[5*6+3],image[5*6+4]}};
logic [chan*5*5-1:0] image_slice3;
assign image_slice3 = {chan{image[0*6+1],image[0*6+2],image[0*6+3],image[0*6+4],image[0*6+5],image[1*6+1],image[1*6+2],image[1*6+3],image[1*6+4],image[1*6+5],image[2*6+1],image[2*6+2],image[2*6+3],image[2*6+4],image[2*6+5],image[3*6+1],image[3*6+2],image[3*6+3],image[3*6+4],image[3*6+5],image[4*6+1],image[4*6+2],image[4*6+3],image[4*6+4],image[4*6+5]}};
logic [chan*5*5-1:0] image_slice4;
assign image_slice4 = {chan{image[1*6+1],image[1*6+2],image[1*6+3],image[1*6+4],image[1*6+5],image[2*6+1],image[2*6+2],image[2*6+3],image[2*6+4],image[2*6+5],image[3*6+1],image[3*6+2],image[3*6+3],image[3*6+4],image[3*6+5],image[4*6+1],image[4*6+2],image[4*6+3],image[4*6+4],image[4*6+5],image[5*6+1],image[5*6+2],image[5*6+3],image[5*6+4],image[5*6+5]}};


logic [0:chan*5*5-1] kernel_slice;
assign kernel_slice = {kernels[0*25+0*5+0],kernels[0*25+0*5+1],kernels[0*25+0*5+2],kernels[0*25+0*5+3],kernels[0*25+0*5+4],kernels[0*25+1*5+0],kernels[0*25+1*5+1],kernels[0*25+1*5+2],kernels[0*25+1*5+3],kernels[0*25+1*5+4],kernels[0*25+2*5+0],kernels[0*25+2*5+1],kernels[0*25+2*5+2],kernels[0*25+2*5+3],kernels[0*25+2*5+4],kernels[0*25+3*5+0],kernels[0*25+3*5+1],kernels[0*25+3*5+2],kernels[0*25+3*5+3],kernels[0*25+3*5+4],kernels[0*25+4*5+0],kernels[0*25+4*5+1],kernels[0*25+4*5+2],kernels[0*25+4*5+3],kernels[0*25+4*5+4],kernels[1*25+0*5+0],kernels[1*25+0*5+1],kernels[1*25+0*5+2],kernels[1*25+0*5+3],kernels[1*25+0*5+4],kernels[1*25+1*5+0],kernels[1*25+1*5+1],kernels[1*25+1*5+2],kernels[1*25+1*5+3],kernels[1*25+1*5+4],kernels[1*25+2*5+0],kernels[1*25+2*5+1],kernels[1*25+2*5+2],kernels[1*25+2*5+3],kernels[1*25+2*5+4],kernels[1*25+3*5+0],kernels[1*25+3*5+1],kernels[1*25+3*5+2],kernels[1*25+3*5+3],kernels[1*25+3*5+4],kernels[1*25+4*5+0],kernels[1*25+4*5+1],kernels[1*25+4*5+2],kernels[1*25+4*5+3],kernels[1*25+4*5+4],kernels[2*25+0*5+0],kernels[2*25+0*5+1],kernels[2*25+0*5+2],kernels[2*25+0*5+3],kernels[2*25+0*5+4],kernels[2*25+1*5+0],kernels[2*25+1*5+1],kernels[2*25+1*5+2],kernels[2*25+1*5+3],kernels[2*25+1*5+4],kernels[2*25+2*5+0],kernels[2*25+2*5+1],kernels[2*25+2*5+2],kernels[2*25+2*5+3],kernels[2*25+2*5+4],kernels[2*25+3*5+0],kernels[2*25+3*5+1],kernels[2*25+3*5+2],kernels[2*25+3*5+3],kernels[2*25+3*5+4],kernels[2*25+4*5+0],kernels[2*25+4*5+1],kernels[2*25+4*5+2],kernels[2*25+4*5+3],kernels[2*25+4*5+4],kernels[3*25+0*5+0],kernels[3*25+0*5+1],kernels[3*25+0*5+2],kernels[3*25+0*5+3],kernels[3*25+0*5+4],kernels[3*25+1*5+0],kernels[3*25+1*5+1],kernels[3*25+1*5+2],kernels[3*25+1*5+3],kernels[3*25+1*5+4],kernels[3*25+2*5+0],kernels[3*25+2*5+1],kernels[3*25+2*5+2],kernels[3*25+2*5+3],kernels[3*25+2*5+4],kernels[3*25+3*5+0],kernels[3*25+3*5+1],kernels[3*25+3*5+2],kernels[3*25+3*5+3],kernels[3*25+3*5+4],kernels[3*25+4*5+0],kernels[3*25+4*5+1],kernels[3*25+4*5+2],kernels[3*25+4*5+3],kernels[3*25+4*5+4],kernels[4*25+0*5+0],kernels[4*25+0*5+1],kernels[4*25+0*5+2],kernels[4*25+0*5+3],kernels[4*25+0*5+4],kernels[4*25+1*5+0],kernels[4*25+1*5+1],kernels[4*25+1*5+2],kernels[4*25+1*5+3],kernels[4*25+1*5+4],kernels[4*25+2*5+0],kernels[4*25+2*5+1],kernels[4*25+2*5+2],kernels[4*25+2*5+3],kernels[4*25+2*5+4],kernels[4*25+3*5+0],kernels[4*25+3*5+1],kernels[4*25+3*5+2],kernels[4*25+3*5+3],kernels[4*25+3*5+4],kernels[4*25+4*5+0],kernels[4*25+4*5+1],kernels[4*25+4*5+2],kernels[4*25+4*5+3],kernels[4*25+4*5+4]};

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
