p_dim = 2  # pool dimention
i_dim = 24 # input dimention
o_dim = int(i_dim/p_dim) # output dimention

f = open('poolchan1.sv','w')

f.write("module poolchan1 (\n")
f.write("    input  logic pool_in [0:24][0:24],\n")
f.write("    output logic pool_out[0:12][0:12]\n")
f.write(");\n\n")

f.write("always_ff @(posedge clk) begin\n")
f.write("    if(~rst_n) begin\n")

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

f.write("module poolchan2 (\n");
f.write("    input  logic pool_in [0:7][0:7],\n");
f.write("    output logic pool_out[0:3][0:3]\n");
f.write(");\n\n");

f.write("always_ff @(posedge clk) begin\n")
f.write("    if(~rst_n) begin\n")

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