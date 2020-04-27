

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
  logic [bW-1: 0] kernel_offset;
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
   int img, f, val, x, y, cycles;


  //
  // Load memory while we reset the machine
  //
  initial begin

    rst_n = 1'b0;
    for (cycles = 0; cycles < 5; cycles = cycles + 1) begin
        #500 clk = 1'b0 ;
	#500 clk = 1'b1 ;
    end
              


   for (img = 0; img < 1; img = img + 1) begin
     f = $fopen("../inputs/image%d.dat", img, "r");
     for  (y = 0; y < 28; y = y + 1) begin
       for (x = 0; x < 28; x = x + 1) begin
         $fscanf(f, "%b ", val );
         image[y][x] = val;
       end
     end




    f = $fopen("../inputs/winner%d.dat", img, "r");
    
    $fscanf(f, "%d", val);
    class_out = val;
    

    image_in_valid = 1'b1;
    class_out_ready = 1'b1;

        // Clock the input through the pipline stages
        for (cycles = 0; cycles < 5; cycles = cycles + 1) begin
                #500 clk = 1'b0 ;
                #500 clk = 1'b1 ;
        end
    image_in_valid = 1'b0;
      // Check output
      assert(golden_output === class_out);


    end



   $finish(1);
   end


endmodule // top_top
