module poolchan2 (
    input  logic pool_in [0:7][0:7],
    output logic pool_out[0:3][0:3]
);

always_ff @(posedge clk) begin
    if(~rst_n) begin
        pool_out[0][0] <= 1'b0;
        pool_out[0][1] <= 1'b0;
        pool_out[0][2] <= 1'b0;
        pool_out[0][3] <= 1'b0;
        pool_out[1][0] <= 1'b0;
        pool_out[1][1] <= 1'b0;
        pool_out[1][2] <= 1'b0;
        pool_out[1][3] <= 1'b0;
        pool_out[2][0] <= 1'b0;
        pool_out[2][1] <= 1'b0;
        pool_out[2][2] <= 1'b0;
        pool_out[2][3] <= 1'b0;
        pool_out[3][0] <= 1'b0;
        pool_out[3][1] <= 1'b0;
        pool_out[3][2] <= 1'b0;
        pool_out[3][3] <= 1'b0;
    end else begin
        pool_out[0][0] <= |{pool_in[0][0], pool_in[0][1], pool_in[1][0], pool_in[1][1]};
        pool_out[0][1] <= |{pool_in[0][2], pool_in[0][3], pool_in[1][2], pool_in[1][3]};
        pool_out[0][2] <= |{pool_in[0][4], pool_in[0][5], pool_in[1][4], pool_in[1][5]};
        pool_out[0][3] <= |{pool_in[0][6], pool_in[0][7], pool_in[1][6], pool_in[1][7]};

        pool_out[1][0] <= |{pool_in[2][0], pool_in[2][1], pool_in[3][0], pool_in[3][1]};
        pool_out[1][1] <= |{pool_in[2][2], pool_in[2][3], pool_in[3][2], pool_in[3][3]};
        pool_out[1][2] <= |{pool_in[2][4], pool_in[2][5], pool_in[3][4], pool_in[3][5]};
        pool_out[1][3] <= |{pool_in[2][6], pool_in[2][7], pool_in[3][6], pool_in[3][7]};

        pool_out[2][0] <= |{pool_in[4][0], pool_in[4][1], pool_in[5][0], pool_in[5][1]};
        pool_out[2][1] <= |{pool_in[4][2], pool_in[4][3], pool_in[5][2], pool_in[5][3]};
        pool_out[2][2] <= |{pool_in[4][4], pool_in[4][5], pool_in[5][4], pool_in[5][5]};
        pool_out[2][3] <= |{pool_in[4][6], pool_in[4][7], pool_in[5][6], pool_in[5][7]};

        pool_out[3][0] <= |{pool_in[6][0], pool_in[6][1], pool_in[7][0], pool_in[7][1]};
        pool_out[3][1] <= |{pool_in[6][2], pool_in[6][3], pool_in[7][2], pool_in[7][3]};
        pool_out[3][2] <= |{pool_in[6][4], pool_in[6][5], pool_in[7][4], pool_in[7][5]};
        pool_out[3][3] <= |{pool_in[6][6], pool_in[6][7], pool_in[7][6], pool_in[7][7]};

    end
end

endmodule