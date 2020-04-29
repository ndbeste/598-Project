

module top_top
  #( parameter bW = 8,
       parameter fI = 960 )
();

    
  logic           clk;
  logic           rst_n;

  logic           image_in_ready;
  logic           image_in_valid;
  logic           image          [0:27][0:27]; // binary 28 x 28 image = 784 bits

  logic           kernel_in_valid; // assume always ready (one cycle write)
    // input  logic           kernel         [0: 4][0: 4], // 5*5 = 25
  logic [9-1 : 0] kernel_offset;
  logic [10  : 0] kernel_addr;   // 1200 in layer 2 --> log2(1200) > 10
  logic [1   : 0] kernel_layer;  // 1=conv1, 2-conv2, 3=fc
  logic           class_out_ready;
  logic           class_out_valid;
  logic [3   : 0] class_out;

  logic [16:0] golden_fc_output[9:0];
  logic [3:0] golden_output;

  top dut ( .*);





   //
   // How long should our test run 
   // this is our failsafe end to catch run-away programs
   //
   initial begin
      repeat(10000) @(posedge clk) ; // 10000 positive edges
      $finish(1) ; // Note that the input is an error state
   end



   int i;
   int img, f, val, x, y, cycles, filter, node_index, dummy;
   logic [959:0] bin_val;
   string file_name;


  //
  // Load memory while we reset the machine
  //
  initial begin

    rst_n = 1'b0; //Clock through several times on reset
    for (cycles = 0; cycles < 5; cycles = cycles + 1) begin
        #500 clk = 1'b0 ;
	#500 clk = 1'b1 ;
    end
              


   for (img = 0; img < 1; img = img + 1) begin
 	$sformat(file_name, "../inputs/image%0d.dat",img);
     f = $fopen(file_name, "r");
     for  (y = 0; y < 28; y = y + 1) begin
       for (x = 0; x < 28; x = x + 1) begin
         dummy=$fscanf(f, "%b ", val );
         dut.image_mem[y][x] = val;
       end
     end
	$sformat(file_name, "../inputs/conv1_kernel%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<(18*5); filter = filter+1) begin
       for  (y = 0; y < 5; y = y + 1) begin
         for (x = 0; x < 5; x = x + 1) begin
           dummy=$fscanf(f, "%b ", val );
           dut.kernel_mem_1[filter][y][x] = val;
         end
       end
     end
    $sformat(file_name, "../inputs/conv1_bias%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<18; filter = filter+1) begin
           dummy=$fscanf(f, "%d ", val );
           dut.offset_mem_1[filter] = val;

     end
      $sformat(file_name, "../inputs/conv2_bias%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<60; filter = filter+1) begin
           dummy=$fscanf(f, "%d ", val );
           dut.offset_mem_2[filter] = val;

     end


	$sformat(file_name, "../inputs/conv2_kernel%0d.dat",img);
     f = $fopen(file_name, "r");
     for (filter=0; filter<(18*60); filter = filter+1) begin
       for  (y = 0; y < 5; y = y + 1) begin
         for (x = 0; x < 5; x = x + 1) begin
           dummy=$fscanf(f, "%b ", val );
           dut.kernel_mem_2[filter][y][x] = val;
         end
       end
     end

	$sformat(file_name, "../inputs/fc_weights%0d.dat",img);
    f = $fopen(file_name, "r");
   while (  2 == $fscanf(f, "%d %d", node_index, val ) )
   begin
         dut.kernel_mem_fc[node_index] = val;

   end
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
         dut.kernel_mem_fc_bin[node_index][i] = bin_val[i];
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
     $display("The following numbers should always be equal");
	$sformat(file_name, "../inputs/fc_output%0d.dat",img);
    f = $fopen(file_name, "r");
    for(i = 0; i < 10; i ++) begin
       $display(dut.full_con_out[i]);
       dummy=$fscanf(f, "%d", val );
       $display(val);
       assert(val == dut.full_con_out[i]);
    end
    
       
    //f = $fopen({"../inputs/winner", img, ".dat"}, "r");
    //dummy=$fscanf(f, "%d", val);
    //golden_output = val;
    

    image_in_valid = 1'b1;
    class_out_ready = 1'b1;

        // Clock the input through the pipline stages
        for (cycles = 0; cycles < 5; cycles = cycles + 1) begin
                #500 clk = 1'b0 ;
                #500 clk = 1'b1 ;
        end
    //image_in_valid = 1'b0;
      // Check output
      //assert(golden_output === class_out);
	//$display(class_out);
	//$display(golden_output);
        //$sformat(file_name, "../inputs/image%0d.dat",img);
	//$display(file_name);


    end



   $finish(1);
   end


endmodule // top_top
