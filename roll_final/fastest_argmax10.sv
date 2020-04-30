// Area = 2039 um2, Timing = 563.6ps, Power = 1.62e-02 mW
// Other (fast_argmax10) below
// Area = 1028 um2, Timing = 822.8ps, Power = 9.40e-03 mW

module fastest_argmax10
	#( parameter bW = 17 )
	 ( 

     input  logic clk,
     input  logic rst_n,
     input  logic arg_in_valid,
     output logic arg_out_valid,
     input  logic [bW-1:0] bids [0:9],
	   output logic [3:0] win_out
	 );

always_ff @(posedge clk) begin //lazy shift register way
      if (~rst_n) begin
         arg_out_valid <= 1'b0;
      end else begin
         arg_out_valid <= arg_in_valid;
      end
    end

  logic gt01, gt02, gt03, gt04, gt05, gt06, gt07, gt08, gt09, gt12, gt13, gt14, gt15, gt16, gt17, gt18, gt19, gt23, gt24, gt25, gt26, gt27, gt28, gt29, gt34, gt35, gt36, gt37, gt38, gt39, gt45, gt46, gt47, gt48, gt49, gt56, gt57, gt58, gt59, gt67, gt68, gt69, gt78, gt79, gt89;

  assign gt01 = bids[0] > bids[1];
  assign gt02 = bids[0] > bids[2];
  assign gt03 = bids[0] > bids[3];
  assign gt04 = bids[0] > bids[4];
  assign gt05 = bids[0] > bids[5];
  assign gt06 = bids[0] > bids[6];
  assign gt07 = bids[0] > bids[7];
  assign gt08 = bids[0] > bids[8];
  assign gt09 = bids[0] > bids[9];
  assign gt12 = bids[1] > bids[2];
  assign gt13 = bids[1] > bids[3];
  assign gt14 = bids[1] > bids[4];
  assign gt15 = bids[1] > bids[5];
  assign gt16 = bids[1] > bids[6];
  assign gt17 = bids[1] > bids[7];
  assign gt18 = bids[1] > bids[8];
  assign gt19 = bids[1] > bids[9];
  assign gt23 = bids[2] > bids[3];
  assign gt24 = bids[2] > bids[4];
  assign gt25 = bids[2] > bids[5];
  assign gt26 = bids[2] > bids[6];
  assign gt27 = bids[2] > bids[7];
  assign gt28 = bids[2] > bids[8];
  assign gt29 = bids[2] > bids[9];
  assign gt34 = bids[3] > bids[4];
  assign gt35 = bids[3] > bids[5];
  assign gt36 = bids[3] > bids[6];
  assign gt37 = bids[3] > bids[7];
  assign gt38 = bids[3] > bids[8];
  assign gt39 = bids[3] > bids[9];
  assign gt45 = bids[4] > bids[5];
  assign gt46 = bids[4] > bids[6];
  assign gt47 = bids[4] > bids[7];
  assign gt48 = bids[4] > bids[8];
  assign gt49 = bids[4] > bids[9];
  assign gt56 = bids[5] > bids[6];
  assign gt57 = bids[5] > bids[7];
  assign gt58 = bids[5] > bids[8];
  assign gt59 = bids[5] > bids[9];
  assign gt67 = bids[6] > bids[7];
  assign gt68 = bids[6] > bids[8];
  assign gt69 = bids[6] > bids[9];
  assign gt78 = bids[7] > bids[8];
  assign gt79 = bids[7] > bids[9];
  assign gt89 = bids[8] > bids[9];
  
  logic [3:0] winner;
  always_comb begin
    unique case (1'b1)
      gt01 && gt02 && gt03 && gt04 && gt05 && gt06 && gt07 && gt08 && gt09 : winner = 4'd0;
      ~gt01 && gt12 && gt13 && gt14 && gt15 && gt16 && gt17 && gt18 && gt19 : winner = 4'd1;
      ~gt02 && ~gt12 && gt23 && gt24 && gt25 && gt26 && gt27 && gt28 && gt29 : winner = 4'd2;
      ~gt03 && ~gt13 && ~gt23 && gt34 && gt35 && gt36 && gt37 && gt38 && gt39 : winner = 4'd3;
      ~gt04 && ~gt14 && ~gt24 && ~gt34 && gt45 && gt46 && gt47 && gt48 && gt49 : winner = 4'd4;
      ~gt05 && ~gt15 && ~gt25 && ~gt35 && ~gt45 && gt56 && gt57 && gt58 && gt59 : winner = 4'd5;
      ~gt06 && ~gt16 && ~gt26 && ~gt36 && ~gt46 && ~gt56 && gt67 && gt68 && gt69 : winner = 4'd6;
      ~gt07 && ~gt17 && ~gt27 && ~gt37 && ~gt47 && ~gt57 && ~gt67 && gt78 && gt79 : winner = 4'd7;
      ~gt08 && ~gt18 && ~gt28 && ~gt38 && ~gt48 && ~gt58 && ~gt68 && ~gt78 && gt89 : winner = 4'd8;
      default : winner =  4'd9;
   endcase
  end
       
 always_ff @(posedge clk) begin
   if(~rst_n) begin
     win_out <= '0;
   end else begin
     win_out <= winner;
   end
 end



endmodule


