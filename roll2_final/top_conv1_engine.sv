module top_conv1_engine();

logic clk;
logic begin_conv;
logic done_conv;
logic image[0:27][0:27];
logic kernels[0:18-1][0:5-1][0:5-1][0:5-1];
logic [7-1:0] offset [0:18-1];
logic  out_fmap[0:11][0:11][0:18-1];


  conv1_engine dut ( .*);

int f, dummy, filter, x, y, val, img;
string file_name;
int c;
initial begin

for (img = 0; img < 1; img = img + 1) begin
 	$sformat(file_name, "../inputs/image%0d.dat",img);
     f = $fopen(file_name, "r");
     for  (y = 0; y < 28; y = y + 1) begin
       for (x = 0; x < 28; x = x + 1) begin
         dummy=$fscanf(f, "%b ", val );
         image[y][x] = val;
       end
     end
	$sformat(file_name, "../inputs/conv1_kernel%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<(18*5); filter = filter+1) begin
       for  (y = 0; y < 5; y = y + 1) begin
         for (x = 0; x < 5; x = x + 1) begin
           dummy=$fscanf(f, "%b ", val );
           kernels[filter/5][filter%5][y][x] = val;
         end
       end
     end
    $sformat(file_name, "../inputs/conv1_bias%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<18; filter = filter+1) begin
           dummy=$fscanf(f, "%d ", val );

           offset[filter] = val;


     end


    begin_conv=1'b1;#10;
clk=1'b0;#100;
clk=1'b1;#100;
begin_conv=1'b0;#10;



for( c=0; c < 200; c++) begin
clk=1'b0;#100;
clk=1'b1;#100;

//$display(dut.pixel_array);


if(dut.row_cnt == 10 && dut.col_cnt ==3) begin
//$display("Ready");
//$display(image[11][11]);
//$display(dut.image_section[1][1]);
//$display(dut.image_section);
$display(dut.conv.c2.sum1);
$display(dut.conv.c2.sum2);
$display(dut.conv.c2.sum3);
$display(dut.conv.c2.sum4);
$display(dut.conv.c2.offset);
for (x=0; x < 25; x ++) begin
$display("%b",dut.conv.c1.image_slice1[x]);
end
//$display("%b",dut.conv.c1.kernel_slice);
//$display(kernels[1][0][0][1]);
//$display(dut.conv.image[0][1]);
//$display(image[10][11]);
//$display(dut.image_section[0][1]);
//$display("%b",dut.conv.c1.image_slice4);
//$display("%b",dut.conv.c1.image_slice1);
//$display("%b",dut.conv.c1.image_slice2);
//$display("%b",dut.conv.c1.image_slice3);
//$display(dut.conv.c1.image);
//$display(dut.conv.image);
//$display(offset[1]);
end


if(done_conv) begin
$display(out_fmap[10][3]);
$display(out_fmap[10][3][2]);
//$display(kernels[2][5]);
//$display(kernels[0][1]);
//$display(kernels[0][2]);
//$display(dut.conv.image);


end

end
/*
$display(dut.conv.image);
$display(dut.image_section);
$display(dut.conv.image);
$display(dut.conv.c0.image_slice1);
$display(dut.conv.c0.pixel);
$display(dut.pixel_array);
$display(out_fmap[0][0]);
$display(out_fmap[0][1]);
$display(out_fmap[1][0]);
$display(out_fmap[10][1]);
$display(out_fmap[10][0]);
*/

end








$finish();

end



endmodule
