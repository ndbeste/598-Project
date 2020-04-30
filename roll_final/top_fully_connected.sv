

module top_fully_connected
();

  logic clk;
  logic rst;
  logic [959:0] fan_in;
  logic [7:0] weights [9:0];
  logic [959:0] binary_weights [9:0];
  logic [16:0] fan_out[9:0];

  logic [16:0] golden_output[9:0];

  fully_connected fc ( .clk(clk), .fan_in(fan_in), .weights(weights), .binary_weights(binary_weights), .fan_out(fan_out));


    // A clock for sequencing
    initial begin 
        clk = 1'b0 ;
        while(1) begin
                #500 clk = 1'b0 ;
                #500 clk = 1'b1 ;
        end
    end


   //
   // How long should our test run 
   // this is our failsafe end to catch run-away programs
   //
   initial begin
      repeat(10000) @(posedge clk) ; // 100 positive edges
      $finish(1) ; // Note that the input is an error state
   end



  int i, dummy;
  final begin
    for (i = 0; i < 10; i = i + 1) begin
      
      //$display("%h", fc.fan_in);
      //$display("%h", fc.binary_weights[i]);
      //$display("%h", fc.xnor_result[i]);
      //$display("%d", fc.accumulation_result[i]);
      //$display("%d", fc.accumulation_after_bias[i]);
      $display("%d: Golden=%d, Simulation=%d\n", i, golden_output[i], fan_out[i]);
      assert(golden_output[i] === fan_out[i]);
    end

  end

   int fd, fi, fw, fo, node_index, val;
   logic [959:0] val_bit;

  //
  // Load memory while we reset the machine
  //
  initial begin

    rst = 1'b0;
    @(negedge clk);
    @(negedge clk);



   fw = $fopen("../inputs/fc_weights.dat", "r");
   while (  2 == $fscanf(fw, "%d %d", node_index, val ) )
   begin
         weights[node_index] = val;

   end
   fi = $fopen("../inputs/fc_input.dat", "r");

    for(i = 0; i < 960; i ++) begin

       dummy=$fscanf(fi, "%b", val_bit );
       fan_in[959-i] = val_bit;
    end

     fo = $fopen("../inputs/fc_output.dat", "r");

    for(i = 0; i < 960; i ++) begin

       dummy=$fscanf(fo, "%d", val );
       golden_output[i] = val;
    end

   fd = $fopen("../inputs/fc_binary_weights.dat", "r");
   while (  2 == $fscanf(fd, "%d %b", node_index, val_bit ) )
   begin
    for(i = 0; i < 960; i ++) begin
         binary_weights[node_index][i] = val_bit[i];
    end 
  end

    @(negedge clk);
    @(negedge clk);
    #5
    rst = 1'b1;

   end


endmodule // top_fc
