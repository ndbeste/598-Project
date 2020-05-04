

module top_top
  #( parameter bW = 8,
       parameter fI = 960 )
();
  




  logic           clk;
  logic           rst_n;

  logic           image_in_ready;
  logic           image_in_valid;
  logic           image          [0:28*28-1]; // binary 28 x 28 image = 784 bits

    // input  logic           kernel         [0: 4][0: 4], // 5*5 = 25
  logic [1   : 0] kernel_layer;  // 1=conv1, 2-conv2, 3=fc
  logic [1 : 0] offset_layer;
  logic           class_out_ready;
  logic           class_out_valid;
  logic [3   : 0] class_out;

  logic [16:0] golden_fc_output[9:0];

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
   int img, f, val, x, y, cycles, filter, node_index, dummy;
   logic [959:0] bin_val;
   string file_name;
   logic [ 28:0] ld1, ld2, ld3;


   int largest_ind, largest_num;
 
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
     for (filter=0; filter<(60*18); filter = filter+1) begin
       for  (y = 0; y < 5; y = y + 1) begin
         for (x = 0; x < 5; x = x + 1) begin
           dummy=$fscanf(f, "%b ", val );
           image[y*5+x] = val;
         end
       end
          
          ld1 = (filter%18);
          ld2 = filter/18;
          image[4*28+0] = ld1[0];
          image[4*28+1] = ld1[1];
          image[4*28+2] = ld1[2];
          image[4*28+3] = ld1[3];
          image[4*28+4] = ld1[4];
          image[7*28+0] = ld2[0];
          image[7*28+1] = ld2[1];
          image[7*28+2] = ld2[2];
          image[7*28+3] = ld2[3];
          image[7*28+4] = ld2[4];
          image[7*28+5] = ld2[5];
          kernel_layer = 2'd2;
          #499 clk = 1'b0 ;
	  #500 clk = 1'b1 ;
          #1;



       
     end



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
	image[8*28+9] = ld1[9];

        image[3*28+0] = ld2[0];


        kernel_layer = 2'd3;
          #498 clk = 1'b0 ;
	  #500 clk = 1'b1 ;
          #2;


    end 
  end


kernel_layer = 2'd0;

// OK - Now start lookin at images
   for (img = 0; img < 15; img = img + 1) begin
 	$sformat(file_name, "../inputs/image%0d.dat",img);
     f = $fopen(file_name, "r");
     for  (y = 0; y < 28; y = y + 1) begin
       for (x = 0; x < 28; x = x + 1) begin
         dummy=$fscanf(f, "%b ", val );
         image[y*28+x] = val;
       end
     end

     


    image_in_valid = 1'b1;
    #500 clk = 1'b0 ;
    #500 clk = 1'b1 ;
    #500 clk = 1'b0 ;
    image_in_valid = 1'b0;
    class_out_ready = 1'b1;
        x = 1;
        // Clock the input through the pipline stages
        while (~class_out_valid) begin
                
                #500 clk = 1'b1 ;
                #500 clk = 1'b0 ;
                x+=1;
           //$display(dut.c1.col_cnt, dut.c2.channel_cnt);
        end

        $display("The image took %d cycles to complete",x);




	$display("The following numbers should always be equal");
	$sformat(file_name, "../inputs/fc_output%0d.dat",img);
    f = $fopen(file_name, "r");
    largest_ind = 0;
    largest_num = 0;
    for(i = 0; i < 10; i ++) begin
       // Uncomment displays for more info in top level tb
       $display(dut.fc_out[i]);
       dummy=$fscanf(f, "%d", val );
       $display(val);
       if (val > largest_num) begin largest_num = val; largest_ind = i; end
       assert(val === dut.fc_out[i]);

    end


    assert (largest_ind === class_out);
    $display("Test Image %d=> Golden Winner: %d - Tested Winner: %d", img, largest_ind, class_out);


    end





   $finish(1);
   end


endmodule // top_top
