f = open("pool1.sv", "w")

f.write("\
module pool1(\n\
    input  logic                clk       ,\n\
    input  logic                rst_n     ,\n\
    input  logic [0:18*24*24-1] fmaps_in  ,\n\
    output logic [0:18*12*12-1] fmaps_out\n\
    );\n\
")

f.write("\n")

for i in range(18):
    f.write("poolchan1 p_1_%s (.clk, .rst_n, .i_pool_in(fmaps_in[%s*24*24:%s*24*24-1]), .o_pool_out(fmaps_out[%s*12*12:%s*12*12-1]));\n"%(i,i,i+1,i,i+1))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("pool2.sv", "w")

f.write("\
module pool2(\n\
    input  logic clk                    ,\n\
    input  logic rst_n                  ,\n\
    input  logic [0:60*8*8-1] fmaps_in  ,\n\
    output logic [0:60*4*4-1] fmaps_out \n\
    );\n\
")

f.write("\n")

for i in range(60):
    f.write("poolchan2 p_2_%s (.clk, .rst_n, .i_pool_in(fmaps_in[%s*8*8:%s*8*8-1]), .o_pool_out(fmaps_out[%s*4*4:%s*4*4-1]));\n"%(i,i,i+1,i,i+1))

f.write("\nendmodule")
f.close()
