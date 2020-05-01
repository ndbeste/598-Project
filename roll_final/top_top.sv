

module top_top
  #( parameter bW = 8,
       parameter fI = 960 )
();
  




  logic           clk;
  logic           rst_n;

  logic           image_in_ready;
  logic           image_in_valid;
  logic           image          [0:28*28-1]; // binary 28 x 28 image = 784 bits

  logic           kernel_in_valid; // assume always ready (one cycle write)
    // input  logic           kernel         [0: 4][0: 4], // 5*5 = 25
  logic [9-1 : 0] kernel_offset;
  logic [10  : 0] kernel_addr;   // 1200 in layer 2 --> log2(1200) > 10
  logic [1   : 0] kernel_layer;  // 1=conv1, 2-conv2, 3=fc
  logic [1 : 0] offset_layer;
  logic           class_out_ready;
  logic           class_out_valid;
  logic [3   : 0] class_out;

  logic [16:0] golden_fc_output[9:0];
  logic [3:0] golden_output;

  top dut ( .*);


  initial begin 
    $dumpfile("current_output.vcd" ); 
    $dumpvars(0,top_top); 
  end 


   //
   // How long should our test run 
   // this is our failsafe end to catch run-away programs
   //
   initial begin
      repeat(100000) @(posedge clk) ; // 10000 positive edges
      $finish(1) ; // Note that the input is an error state
   end



   int i;
   int img, f, val, x, y,z,q,r, cycles, filter, node_index, dummy;
   logic [959:0] bin_val;
   string file_name;
   logic [ 28:0] ld1, ld2, ld3;

   logic [959:0] fan_in;
  //
  // Load memory while we reset the machine
  //
  initial begin

    rst_n = 1'b0; //Clock through several times on reset
    for (cycles = 0; cycles < 5; cycles = cycles + 1) begin
        #499 clk = 1'b0 ;
	#500 clk = 1'b1 ;
        #1;
        
    end
    rst_n = 1'b1;

img=0 ;

$sformat(file_name, "../inputs/conv1_kernel%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<(18*5); filter = filter+1) begin
       for  (y = 0; y < 5; y = y + 1) begin
         for (x = 0; x < 5; x = x + 1) begin
           dummy=$fscanf(f, "%b ", val );
           image[y*5+x] = val;
         end
       end
          
          ld1 = (filter%5);
          ld2 = filter/5;
          image[5*28+0] = ld1[0];
          image[5*28+1] = ld1[1];
          image[5*28+2] = ld1[2];
          image[4*28+0] = ld2[0];
          image[4*28+1] = ld2[1];
          image[4*28+2] = ld2[2];
          image[4*28+3] = ld2[3];
          image[4*28+4] = ld2[4];
          kernel_layer = 2'd1;
          #499 clk = 1'b0 ;
	  #500 clk = 1'b1 ;
          #1;



       
     end



    kernel_layer = 2'd0;

    $sformat(file_name, "../inputs/conv1_bias%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<18; filter = filter+1) begin
           dummy=$fscanf(f, "%d ", val );
           //dut.offset_mem1[filter] = val;

	ld2 = filter;
           ld1 = val;
           
           image[3*28+0] = ld1[0];
	image[3*28+1] = ld1[1];
	image[3*28+2] = ld1[2];
	image[3*28+3] = ld1[3];
	image[3*28+4] = ld1[4];
	image[3*28+5] = ld1[5];
	image[3*28+6] = ld1[6];
	image[3*28+7] = 0;
	image[3*28+8] = 0;

           image[4*28+0] = ld2[0];
	image[4*28+1] = ld2[1];
	image[4*28+2] = ld2[2];
	image[4*28+3] = ld2[3];
	image[4*28+4] = ld2[4];
	image[4*28+5] = ld2[5];

        offset_layer = 2'd1;
          #499 clk = 1'b0 ;
	  #500 clk = 1'b1 ;
          #1;

     end
offset_layer = 2'd0;
      $sformat(file_name, "../inputs/conv2_bias%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<60; filter = filter+1) begin
           dummy=$fscanf(f, "%d ", val );
           
	ld2 = filter;
           ld1 = val;
           
           image[3*28+0] = ld1[0];
	image[3*28+1] = ld1[1];
	image[3*28+2] = ld1[2];
	image[3*28+3] = ld1[3];
	image[3*28+4] = ld1[4];
	image[3*28+5] = ld1[5];
	image[3*28+6] = ld1[6];
	image[3*28+7] = ld1[7];
	image[3*28+8] = ld1[8];

           image[7*28+0] = ld2[0];
	image[7*28+1] = ld2[1];
	image[7*28+2] = ld2[2];
	image[7*28+3] = ld2[3];
	image[7*28+4] = ld2[4];
	image[7*28+5] = ld2[5];

        offset_layer = 2'd2;
          #499 clk = 1'b0 ;
	  #500 clk = 1'b1 ;
          #1;

     end
offset_layer = 2'd0;

	$sformat(file_name, "../inputs/conv2_kernel%0d.dat",img);
     f = $fopen(file_name, "r");
     q = 0;
     r = 0;
     for (filter=0; filter<(18*60); filter = filter+1) begin
       for  (y = 0; y < 5; y = y + 1) begin
         for (x = 0; x < 5; x = x + 1) begin
           dummy=$fscanf(f, "%b ", val );
           dut.kernel_mem2[filter][y*5+x] = val;
#1;
/*
           image[0][y*5+x] = val;
if (q < 450) begin
            r+=val;
       end
       q+=1;
*/
         end
       end
       
/*
          
          ld2 = (filter%18);
          ld1 = filter/18;
          image[7*28+0] = ld1[0];
          image[7*28+1] = ld1[1];
          image[7*28+2] = ld1[2];
          image[7*28+3] = ld1[3];
          image[7*28+4] = ld1[4];
          image[7*28+5] = ld1[5];
          image[4*28+0] = ld2[0];
          image[4*28+1] = ld2[1];
          image[4*28+2] = ld2[2];
          image[4*28+3] = ld2[3];
          image[4*28+4] = ld2[4];
          kernel_layer = 2'd2;
          #499 clk = 1'b0 ;
	  #500 clk = 1'b1 ;
          #1;

*/

       
     end

$display("Done dounting", r);
kernel_layer = 2'd0;
	$sformat(file_name, "../inputs/fc_weights%0d.dat",img);
    f = $fopen(file_name, "r");
   while (  2 == $fscanf(f, "%d %d", node_index, val ) )
   begin
  
         ld2 = node_index;
           ld1 = val;
           
           image[3*28+0] = ld1[0];
	image[3*28+1] = ld1[1];
	image[3*28+2] = ld1[2];
	image[3*28+3] = ld1[3];
	image[3*28+4] = ld1[4];
	image[3*28+5] = ld1[5];
	image[3*28+6] = ld1[6];
	image[3*28+7] = ld1[7];
	image[3*28+8] = 0;

           image[6*28+0] = ld2[0];
	image[6*28+1] = ld2[1];
	image[6*28+2] = ld2[2];
	image[6*28+3] = ld2[3];

        offset_layer = 2'd3;
          #499 clk = 1'b0 ;
	  #500 clk = 1'b1 ;
          #1;



   end
offset_layer = 2'd0;
   //f = $fopen("inputs/fc_input.dat", "r");

    //for(i = 0; i < 960; i ++) begin

    //   $fscanf(f, "%b", val_bit );
    //   fan_in[959-i] = val_bit;
    //end

     //f = $fopen("inputs/fc_output%d.dat", img, "r");

    //for(i = 0; i < 960; i ++) begin

     //  $fscanf(f, "%d", val );
     //  golden_output[i] = val;
    //end




	$sformat(file_name, "../inputs/fc_binary_weights%0d.dat",img);
   f = $fopen(file_name, "r");
   while (  2 == $fscanf(f, "%d %b", node_index, bin_val ) )
   begin
    for(i = 0; i < 960; i ++) begin
         dut.bin_weights_fc[node_index][i] = bin_val[i];
        ld3 = node_index;
           ld1 = i;
           ld2 = bin_val[i];
   
        image[6*28+0] = ld3[0];
	image[6*28+1] = ld3[1];
	image[6*28+2] = ld3[2];
	image[6*28+3] = ld3[3];
        
        image[8*28+0] = ld1[0];
	image[8*28+1] = ld1[1];
	image[8*28+2] = ld1[2];
	image[8*28+3] = ld1[3];
	image[8*28+4] = ld1[4];
	image[8*28+5] = ld1[5];
	image[8*28+6] = ld1[6];
	image[8*28+7] = ld1[7];
	image[8*28+8] = ld1[8];
	image[8*28+8] = ld1[9];

        image[3*28+0] = ld2[0];


        kernel_layer = 2'd3;
          #499 clk = 1'b0 ;
	  #500 clk = 1'b1 ;
          #1;


    end 
  end


kernel_layer = 2'd0;

// OK - Now start lookin at images
   for (img = 0; img < 1; img = img + 1) begin
 	$sformat(file_name, "../inputs/image%0d.dat",img);
     f = $fopen(file_name, "r");
     for  (y = 0; y < 28; y = y + 1) begin
       for (x = 0; x < 28; x = x + 1) begin
         dummy=$fscanf(f, "%b ", val );
         image[y*28+x] = val;
       end
     end
	
    //$display("Showing Stuff now");
    //$display("%h\n",dut.f_kernel1);
    //$display(dut.conv_one_out[0]);
    //$display(dut.c1.conv0.kernel_offset);
    //$display(dut.c1.kernel_offset[0:6]);
    //$display(dut.c1.);
    //$display("%h\n", dut.c1.conv0.image_slice);
    //$display("%h\n", dut.c1.image);
    //$display("%h\n", dut.image_mem[0][0]);
    //$display("%h\n", dut.f_image);
    //$display("%h\n", dut.f_image2);
    //$display("%h\n",dut.f_kernel1[0]);
    //$display("%h\n",dut.f_offset1[0]);
    //$display(file_name);
     
    
       
    //f = $fopen({"../inputs/winner", img, ".dat"}, "r");
    //dummy=$fscanf(f, "%d", val);
    //golden_output = val;
    //$display("aasfc");

    image_in_valid = 1'b1;
    #500 clk = 1'b0 ;
    #500 clk = 1'b1 ;
    #500 clk = 1'b0 ;
    image_in_valid = 1'b0;
    class_out_ready = 1'b1;


        // Clock the input through the pipline stages
        for (cycles = 0; cycles < 500; cycles = cycles + 1) begin
                
                #500 clk = 1'b1 ;
                #500 clk = 1'b0 ;
//	$display(dut.image_ready);
//$display("Conv1 %d",dut.conv1_complete);
if(dut.c2.row_cnt == 2 && dut.c2.col_cnt==2) begin
//$display(dut.c2.conv.c0.sum1);
//$display(dut.c2.conv.c0.sum2);
//$display(dut.c2.conv.c0.sum3);
//$display(dut.c2.conv.c0.sum4);
//$display(dut.c2.conv.c0.offset);
//$display(dut.c2.pixel_array);

end




for (z = 0; z < 18; z++) begin

//$display(dut.conv1_out[z*144+4*12+8]);
end

/*
$display("pay attention");
$display(dut.c1.conv.c0.kernel_slice[4]);
$display(dut.c1.conv.c0.kernels[4]);
$display("----------");
$display(dut.c1.conv.c0.kernel_slice[4]);
$display(dut.c1.conv.c0.kernels[4]);
*/

x = 0;
y = 0;
q=0;
for (z=0; z < 18*5*5; z++) begin
x += (dut.c2.conv.c0.kernels[z]);
y += (dut.kernel_mem2_unroll[z]);
q+= (dut.kernel_mem2[z/25][z%25]);
end
//$display("k count", x,y,q);

if(dut.conv2_complete) begin
x = 0;
for (q = 0; q<(60*60*4); q++) begin
x+= dut.conv2_out[q];
$display(dut.conv2_out[q]);
end


$display("Sum CONV32W");
$display(x);



$display(dut.conv2_out);
$display(dut.conv2_out[0]);
$display(dut.conv2_out[100]);

end

       end






	$display("The following numbers should always be equal");
	$sformat(file_name, "../inputs/fc_output%0d.dat",img);
    f = $fopen(file_name, "r");
    for(i = 0; i < 10; i ++) begin
       $display(dut.fc_out[i]);
       dummy=$fscanf(f, "%d", val );
       $display(val);
       assert(val == dut.fc_out[i]);
    end


    end





   $finish(1);
   end


endmodule // top_top
