

module top_argmax10
();
  logic clk;
  logic rst;
  logic [16:0] bids [9:0];
  logic [3:0] winner;


  argmax10 dut  ( .bids(bids), .winner(winner));


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




  int i;
  initial begin
  #10;
  for (i = 0; i < 10; i = i + 1) begin
    bids[0] = 18'd0;
    bids[1] = 18'd0;
    bids[2] = 18'd0;
    bids[3] = 18'd0;
    bids[4] = 18'd0;
    bids[5] = 18'd0;
    bids[6] = 18'd0;
    bids[7] = 18'd0;
    bids[8] = 18'd0;
    bids[9] = 18'd0;

    bids[i] = 18'd100;
    #1000;
    $display("%d %d", i, winner);
    assert(i === winner);
  end

  end



endmodule // top_fc
