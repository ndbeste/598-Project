module top_conv_pool_pixel125();

logic image[0:5][0:5];
logic kernels[0:5-1][0:4][0:4];
logic [7-1:0] offset;
logic pixel;

conv_pool_pixel125 #(5,7) dut (.*);



int x, y, n;
initial begin


for (x = 0; x <6; x++) begin
for (y = 0; y <6; y++) begin
image[x][y] = 1'b1;


end
end

for (x = 0; x <5; x++) begin
for (y = 0; y <5; y++) begin
for (n = 0; n <5; n++) begin
kernels[n][x][y] = 1'b1;
end
end
end

offset = 7'd19;

#10;

$display(dut.image_slice1);
$display(dut.kernel_slice);
$display(pixel);




$finish();

end



endmodule
