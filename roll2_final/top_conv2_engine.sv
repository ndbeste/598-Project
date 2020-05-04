module top_conv2_engine();

logic clk;
logic begin_conv;
logic done_conv;
logic image[0:27][0:27];
logic kernels[0:18-1][0:5-1][0:5-1][0:5-1];
logic [7-1:0] offset [0:18-1];
logic  out_fmap[0:11][0:11][0:18-1];

//logic begin_conv2;
logic done_conv2;
//logic image2[0:11][0:11][0:18-1]; //18 is out of order due to conv1_engine, but is fixed inisde module
logic kernels2[0:60-1][0:18-1][0:5-1][0:5-1];
logic [9-1:0] offset2 [0:60-1];
logic out_fmap2[0:3][0:3][0:60-1];





  conv1_engine dut ( .*);
  conv2_engine dut2 ( .clk, .begin_conv(done_conv), .done_conv(done_conv2), .image(out_fmap), .kernels(kernels2), .offset(offset2), .out_fmap(out_fmap2));

int f, dummy, filter, x, y, val, img;
string file_name;
int c;
initial begin
$display("STATIGN");

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

    $sformat(file_name, "../inputs/conv2_bias%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<60; filter = filter+1) begin
           dummy=$fscanf(f, "%d ", val );

           offset2[filter] = val;


     end

	$sformat(file_name, "../inputs/conv2_kernel%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<(60*18); filter = filter+1) begin
       for  (y = 0; y < 5; y = y + 1) begin
         for (x = 0; x < 5; x = x + 1) begin
           dummy=$fscanf(f, "%b ", val );
           kernels2[filter/18][filter%18][y][x] = val;
         end
       end
     end


    begin_conv=1'b1;#10;
clk=1'b0;#100;
clk=1'b1;#100;
begin_conv=1'b0;#10;



for( c=0; c < 300; c++) begin
clk=1'b0;#100;
clk=1'b1;#100;


$display(done_conv);

if(done_conv) begin
$display("Done with first conv");
clk=1'b0;#100;
clk=1'b1;#100;
$display(dut2.pixel_array);
$display(dut2.image_section[0]);
$display(dut2.image_section[1]);
$display(dut2.image_section[2]);

end

if(done_conv2) begin
$display("Probably didnt work first try");

$display(out_fmap2);
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
