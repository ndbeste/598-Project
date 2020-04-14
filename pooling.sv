// 2x2 max pooling

module maxPooling #( parameter n = 2 ) // bitwidth
    (
        input   logic   clk,
        input   logic   n_rst,
        input   logic   [n*n : 0] pool_in,
        output  logic   max
    );

    always @(posedge clk)
        if(~rst)
            max <= 1'b0;
        else begin
            if (pool_in[0] == 1 | pool_in[1] == 1 | pool_in[2] == 1 | pool_in[3] == 1)
                max <= 1'b1;
            else
                max <= 1'b0;
        end
    end
endmodule
