f = open("convaccbin1.sv", "w")

f.write("\
module convaccbin1\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:5*18*24*24*bW-1] xor_in         , \n\
    input  logic [0:  18      *bW-1] kernel_offset  , \n\
    output logic [0:  18*24*24   -1] conv_one_out  \n\
    );\n\
")

f.write('\n')

for i in range(18):
    f.write("accbin1 ab_1_%s (.i_accbin_in(xor_in[%s*5*24*24*bW:%s*5*24*24*bW-1]), .kernel_offset(kernel_offset[%s*bW:%s*bW-1]), .o_accbin_out(conv_one_out[%s*24*24:%s*24*24-1]));\n"%(i,i,i+1,i,i+1,i,i+1))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("convaccbin2.sv", "w")

f.write("\
module convaccbin2\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:18*60*8*8*bW-1] xor_in          ,\n\
    input  logic [0:   60    *bW-1] kernel_offset   , \n\
    output logic [0:   60*8*8   -1] conv_one_out \n\
    );\n\
")

f.write("\n")

for i in range(60):
    f.write("accbin2 ab_2_%s (.i_accbin_in(xor_in[%s*18*8*8*bW:%s*18*8*8*bW-1]), .kernel_offset(kernel_offset[%s*bW:%s*bW-1]), .o_accbin_out(conv_one_out[%s*8*8:%s*8*8-1]));\n"%(i,i,i+1,i,i+1,i,i+1))

f.write("\nendmodule")
f.close()