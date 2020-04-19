// In sythesis (with no real timing contraints) - has ~30% improvement in critical path (400ps), but 20-25% increase in area/power


module targmax10
	#( parameter bW = 17 )
	 ( 
            input logic [bW-1:0] bids [9:0],
	   output logic [3:0] winner
	 );

  logic [3:0] max01, max23, max45, max67, max89, max0123, max4567;
  logic [bW-1:0] maxbid01, maxbid23, maxbid45, maxbid67, maxbid89;

  assign max01 = {3'b000, (bids[0] < bids[1])};
  assign max23 = {3'b001, (bids[2] < bids[3])};
  assign max45 = {3'b010, (bids[4] < bids[5])};
  assign max67 = {3'b011, (bids[6] < bids[7])};
  assign max89 = {3'b100, (bids[8] < bids[9])};

  assign maxbid01 = max01 ? bids[1]: bids[0];
  assign maxbid23 = max23 ? bids[3]: bids[2];
  assign maxbid45 = max45 ? bids[5]: bids[4];
  assign maxbid67 = max67 ? bids[7]: bids[6];
  assign maxbid89 = max89 ? bids[9]: bids[8];

  assign max0123 = {2'b00, (bids[max23] > bids[max01]), (bids[max01] > bids[max23])? max01[0] : max23[0] };
  assign max4567 = {2'b01, (bids[max67] > bids[max45]), (bids[max45] > bids[max67])? max45[0] : max67[0] };


  always_comb begin
    priority case (1'b1)
       (bids[max0123] > bids[max89]) && bids[max0123] > bids[max4567] : winner = max0123;
       (bids[max89] > bids[max4567])     : winner = max89;
       default			   : winner =  max4567;
    endcase
  end



endmodule


