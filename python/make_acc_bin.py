f = open("accbin1.sv", "w")

f.write("\
module accbin1\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:5*24*24*bW-1]   i_accbin_in     ,\n\
    input  logic [bW-1:0]           kernel_offset   ,\n\
    output logic [0:24*24-1]        o_accbin_out\n\
    );\n\
\n\
logic [bW-1:0] sum_out         [0:23][0:23];\n\
logic [bW-1:0] accbin_in  [0:4][0:23][0:23];\n\
logic          accbin_out      [0:23][0:23];\n\
\n\
genvar i,j,k;\n\
for (i=0; i<24; i=i+1) begin\n\
    for (j=0; j<24; j=j+1) begin\n\
        for (k=0; k<5; k=k+1) begin\n\
            assign accbin_in[i][j][k][bW-1:0] = i_accbin_in[ 24*5*bW*i + 5*bW*j + bW*k : 24*5*bW*i + 5*bW*j + bW*k + 7 ];\n\
        end\n\
    end\n\
end\n\
\n\
for (i=0; i<24; i=i+1) begin\n\
    for (j=0; j<24; j=j+1) begin\n\
        assign o_accbin_out[ i*24 + j ] = accbin_out[i][j];\n\
    end\n\
end\n\
")

f.write("\n")

for ox in range(24):
    for oy in range(24):
        f.write("assign sum_out[%s][%s][bW-1:0] = "%(ox,oy))
        for c in range(5):
            f.write("accbin_in[%s][%s][%s][bW-1:0]"%(c,ox,oy))
            if c != 4:
                f.write(" + ")
        f.write(";\n")

f.write("\n")

# Compare sum_out with kernel_offset. conv_one_out = (sum_out > kernel_offset) ? 1'b1 : 1'b0;
for ox in range(24):
    for oy in range(24):
        f.write("assign accbin_out[%s][%s] = (sum_out[%s][%s][bW-1:0] > kernel_offset[bW-1:0]) ? 1'b1 : 1'b0;\n"%(ox,oy,ox,oy))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("accbin2.sv", "w")

f.write("\
module accbin2\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:18*8*8*bW-1] i_accbin_in     ,\n\
    input  logic [bW-1:0]          kernel_offset   ,\n\
    output logic [0:8*8-1]         o_accbin_out\n\
    );\n\
\n\
logic [bW-1:0] sum_out         [0:11][0:11];\n\
logic [bW-1:0] accbin_in  [0:4][0:11][0:11];\n\
logic          accbin_out      [0: 7][0: 7];\n\
\n\
genvar i,j,k;\n\
for (i=0; i<12; i=i+1) begin\n\
    for (j=0; j<12; j=j+1) begin\n\
        for (k=0; k<18; k=k+1) begin\n\
            assign accbin_in[i][j][k][bW-1:0] = i_accbin_in[ 12*18*bW*i + 18*bW*j + bW*k : 12*18*bW*i + 18*bW*j + bW*k + 7];\n\
        end\n\
    end\n\
end\n\
\n\
for (i=0; i<12; i=i+1) begin\n\
    for (j=0; j<12; j=j+1) begin\n\
        assign o_accbin_out[ i*12 + j ] = accbin_out[i][j];\n\
    end\n\
end\n\
")

f.write('\n')

for ox in range(12):
    for oy in range(12):
        f.write("assign sum_out[%s][%s][bW-1:0] = "%(ox,oy))
        for c in range(18):
            f.write("accbin_in[%s][%s][%s][bW-1:0]"%(c,ox,oy))
            if c != 17:
                f.write(" + ")
        f.write(";\n")

f.write("\n")

for ox in range(12):
    for oy in range(12):
        f.write("assign accbin_out[%s][%s] = (sum_out[%s][%s][bW-1:0] > kernel_offset[bW-1:0]) ? 1'b1 : 1'b0;\n"%(ox,oy,ox,oy))

f.write("\nendmodule")
f.close()
