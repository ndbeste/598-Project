
module fast_argmax10
	#( parameter bW = 16 )
	 ( 
     input  logic clk,
     input  logic rst_n,
     input  logic [bW-1:0] bids [0:9],
	   output logic [3:0] win_out
	 );

  logic [1:0] max0123, max456;
  logic [3:0] max789; // easier to store as 4 bit
  logic [bW-1:0] maxbid0123, maxbid456, maxbid789;

  logic gt01, gt02, gt03, gt12, gt13, gt23;

  assign gt01 = bids[0] > bids[1];
  assign gt02 = bids[0] > bids[2];
  assign gt03 = bids[0] > bids[3];
  assign gt12 = bids[1] > bids[2];
  assign gt13 = bids[1] > bids[3];
  assign gt23 = bids[2] > bids[3];

  always_comb begin
    unique case (1'b1)
      (gt01) && (gt02) &&  (gt03) : max0123 = 2'd0;
      (~gt01) && (gt12) &&  (gt13) : max0123 = 2'd1;
      (~gt02) && (~gt12) &&  (gt23) : max0123 = 2'd2;
      default : max0123 = 2'd3;
     endcase
  end

  always_comb begin
    unique case (1'b1)
      (gt01) && (gt02) &&  (gt03) : maxbid0123 = bids[0];
      (~gt01) && (gt12) &&  (gt13) : maxbid0123 = bids[1];
      (~gt02) && (~gt12) &&  (gt23) : maxbid0123 = bids[2];
      default : maxbid0123 = bids[3];
     endcase
  end

  logic gt45, gt46, gt56;

  assign gt45 = bids[4] > bids[5];
  assign gt46 = bids[4] > bids[6];
  assign gt56 = bids[5] > bids[6];

  always_comb begin
    unique case (1'b1)
      (gt45) && (gt46): max456 = 2'd0;
      (~gt45) && (gt56): max456 = 2'd1;
      default: max456 = 2'd2;
    endcase
  end

  always_comb begin
    unique case (1'b1)
      (gt45) && (gt46): maxbid456 = bids[4];
      (~gt45) && (gt56): maxbid456 = bids[5];
      default: maxbid456 = bids[6];
    endcase
  end

  logic gt78, gt89, gt79;

  assign gt78 = bids[7] > bids[8];
  assign gt79 = bids[7] > bids[9];
  assign gt89 = bids[8] > bids[9];

  always_comb begin
    unique case (1'b1)
      (gt78) && (gt79) : max789 = 4'd7;
      (~gt78) && (gt89) : max789 = 4'd8;
      default: max789 = 4'd9;
    endcase
  end

  always_comb begin
    unique case (1'b1)
      (gt78) && (gt79) : maxbid789 = bids[7];
      (~gt78) && (gt89) : maxbid789 = bids[8];
      default: maxbid789 = bids[9];
    endcase
  end

  logic sgt01, sgt02, sgt12;

  assign sgt01 = maxbid0123 > maxbid456;
  assign sgt02 = maxbid0123 > maxbid789;
  assign sgt12 = maxbid456 > maxbid789;
  
  logic [3:0] winner;
  always_comb begin
    unique case (1'b1)
      sgt01 && sgt02 : winner = {2'b00, max0123};
      ~sgt01 && sgt12 : winner = {2'b01, max456};
      default : winner =  max789;
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


