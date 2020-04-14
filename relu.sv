module relu #(bw = 8)
(
input       [bw-1:0] data_in,
output  reg [bw-1:0] data_out
);

assign data_out =(data_in[bw-1]==1)? 1'b0 : data_in;


endmodule
