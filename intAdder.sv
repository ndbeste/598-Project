module intAdder #( parameter bW = 8)
(
input  logic clk,
input  logic n_rst,
input  logic [bW-1 : 0] data,
input  logic [bW-1 : 0] offset,
output logic [bW-1 : 0] sum
);

    always_ff @(posedge clk)begin
    	if(~n_rst) sum <= '0;
    	else       sum <= (data << 1) + offset;
    end//end always

endmodule
