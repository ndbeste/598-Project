module top_conv_pool_channels();

logic image[0:5][0:5];
logic kernels[0:18-1][0:5-1][0:5-1][0:5-1];
logic [7-1:0] offset [18-1:0];
logic pixel [18-1:0];

conv_pool_channels dut (.*);


int x,y,n,q;
initial begin


for (x = 0; x <6; x++) begin
for (y = 0; y <6; y++) begin
image[x][y] = 1'b1;
end
end

for (x = 0; x <5; x++) begin
for (y = 0; y <5; y++) begin
for (n = 0; n <5; n++) begin
for (q = 0; q <5; q++) begin
kernels[q][n][x][y] = 1'b1;
end
end
end
end

offset[0] = 7'd19;


#10;


$display(pixel[0]);

$display(pixel[1]);




$finish();

end



endmodule
