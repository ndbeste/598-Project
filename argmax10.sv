
module argmax10
	#( parameter bW = 17 )
	 ( input logic [bW-1:0] bids [9:0],
	   output logic [3:0] winner
	 );

  logic max01, max23, max45, max67, max89;
  logic [bW-1:0] maxbid01, maxbid23, maxbid45, maxbid67, maxbid89;

  assign max01 = (bids[0] < bids[1]);
  assign max23 = (bids[2] < bids[3]);
  assign max45 = (bids[4] < bids[5]);
  assign max67 = (bids[6] < bids[7]);
  assign max89 = (bids[8] < bids[9]);

  assign maxbid01 = max01 ? bids[1]: bids[0];
  assign maxbid23 = max23 ? bids[3]: bids[2];
  assign maxbid45 = max45 ? bids[5]: bids[4];
  assign maxbid67 = max67 ? bids[7]: bids[6];
  assign maxbid89 = max89 ? bids[9]: bids[8];


  logic [1:0] max0123, max4567;
  logic [bW-1:0] maxbid0123, maxbid4567;

  assign max0123 = {(maxbid01 < maxbid23), (maxbid01 < maxbid23) ? max23: max01}; // 2-bit result of index of biggest 0-3
  assign max4567 = {(maxbid45 < maxbid67), (maxbid45 < maxbid67) ? max67: max45}; // 2-bit result of index of biggest 4-7

  assign maxbid0123 = max0123[1] ? maxbid23 : maxbid01;
  assign maxbid4567 = max4567[1] ? maxbid67 : maxbid45;

  logic [2:0] max456789;
  logic [bW-1:0] maxbid456789;

  assign max456789 = {(maxbid89 > maxbid4567), (maxbid89 > maxbid4567) ? {1'b0, max89} : max4567}; // 3-bit result of index of biggest 4-9

  assign maxbid456789 = max456789[2] ? maxbid89 : maxbid4567;

  always_comb begin
    priority case (1'b1)
       (maxbid0123 > maxbid456789) : winner = {2'b00, max0123};
       (maxbid89 > maxbid4567)     : winner = {3'b100, max89};
       default			   : winner = {2'b01, max4567};
    endcase
  end



endmodule


