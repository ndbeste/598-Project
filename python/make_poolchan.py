p_dim = 2  # pool dimention
i_dim = 24 # input dimention
o_dim = int(i_dim/p_dim) # output dimention

f = open('poolchan1.sv','w')


f.write("\
typedef logic       d_fmap1_t     [0:23][0:23] ;\n\
typedef logic       d_pool1_t     [0:11][0:11] ;\n\
\n\
module poolchan1 (\n\
    input  logic             clk        ,\n\
    input  logic             rst_n      ,\n\
    input  logic [0:24*24-1] i_pool_in  ,\n\
    output logic [0:12*12-1] o_pool_out\n\
);\n\
\n\
d_fmap1_t pool_in  ;\n\
d_pool1_t pool_out ;\n\
\n\
genvar i,j;\n\
for (i=0; i<24; i=i+1) begin\n\
    for (j=0; j<24; j=j+1) begin\n\
        assign pool_in[i][j] = i_pool_in[ i*24 + j ];\n\
    end\n\
end\n\
\n\
for (i=0; i<12; i=i+1) begin\n\
    for (j=0; j<12; j=j+1) begin\n\
        assign o_pool_out[i*12 + j] = pool_out[i][j];\n\
    end\n\
end\n\
")

f.write("\n")

for ox in range(o_dim):
    for oy in range(o_dim):
        f.write("        pool_out[%s][%s] <= 1'b0;\n"%(ox,oy))
    f.write("\n")

f.write("    end else begin\n")

for ox in range(o_dim):
    for oy in range(o_dim):
        ix1 = ox*2
        ix2 = ox*2 + 1
        iy1 = oy*2
        iy2 = oy*2 + 1
        sox = str(ox)
        soy = str(oy)
        if ix1 < 10:
            ix1 = str(ix1) + ' '
        if ix2 < 10:
            ix2 = str(ix2) + ' '
        if iy1 < 10:
            iy1 = str(iy1) + ' '
        if iy2 < 10:
            iy2 = str(iy2) + ' '
        if ox < 10:
            sox = sox + ' '
        if oy < 10:
            soy = soy + ' '
        f.write("        pool_out[%s][%s] <= |{pool_in[%s][%s], pool_in[%s][%s], pool_in[%s][%s], pool_in[%s][%s]};\n"%(sox,soy,ix1,iy1,ix1,iy2,ix2,iy1,ix2,iy2))
        # print("assign pool_out[%s][%s] = ~&{pool_in[%s][%s][0], pool_in[%s][%s][0], pool_in[%s][%s][0], pool_in[%s][%s][0]};"%(ox,oy,ix1,iy1,ix1,iy2,ix2,iy1,ix2,iy2))
    f.write("\n")

f.write("    end\n")
f.write("end\n")

f.write("\nendmodule")

########################################################################################

p_dim = 2  # pool dimention
i_dim = 8 # input dimention
o_dim = int(i_dim/p_dim) # output dimention

f = open('poolchan2.sv','w')

f.write("\
typedef logic       d_fmap2_t     [0:7][0:7] ;\n\
typedef logic       d_pool2_t     [0:3][0:3] ;\n\
\n\
module poolchan2 (\n\
    input  logic           clk        ,\n\
    input  logic           rst_n      ,\n\
    input  logic [0:8*8-1] i_pool_in  ,\n\
    output logic [0:4*4-1] o_pool_out \n\
);\n\
\n\
d_fmap2_t pool_in  ;\n\
d_pool2_t pool_out ;\n\
\n\
genvar i,j;\n\
for (i=0; i<8; i=i+1) begin\n\
    for (j=0; j<8; j=j+1) begin\n\
        assign pool_in[i][j] = i_pool_in[ i*8 + j ];\n\
    end\n\
end\n\
for (i=0; i<4; i=i+1) begin\n\
    for (j=0; j<4; j=j+1) begin\n\
        assign o_pool_out[i*4 + j] = pool_out[i][j];\n\
    end\n\
end\n\
")

f.write('\n')

for ox in range(o_dim):
    for oy in range(o_dim):
        f.write("        pool_out[%s][%s] <= 1'b0;\n"%(ox,oy))

f.write("    end else begin\n")

for ox in range(o_dim):
    for oy in range(o_dim):
        ix1 = ox*2
        ix2 = ox*2 + 1
        iy1 = oy*2
        iy2 = oy*2 + 1
        f.write("        pool_out[%s][%s] <= |{pool_in[%s][%s], pool_in[%s][%s], pool_in[%s][%s], pool_in[%s][%s]};\n"%(ox,oy,ix1,iy1,ix1,iy2,ix2,iy1,ix2,iy2))
    f.write("\n")

f.write("    end\n")
f.write("end\n")

f.write("\nendmodule")