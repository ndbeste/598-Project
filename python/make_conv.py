f = open("conv1.sv", "w")

f.write("\
module conv1\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:28*28-1]    image           ,\n\
    input  logic [0:90*5*5-1]   kernels         , \n\
    input  logic [0:18*bW-1]    kernel_offset   ,\n\
    output logic [0:18*24*24-1] conv_one_out  \n\
    );\n\
\n\
logic [0:5*18*24*24*bW-1] xor_out;\n\
")

f.write('\n')

for i in range(90):
    f.write("convchan1 c_1_%s (.i_image(image), .i_kernel(kernels[%s*5*5:%s*5*5-1]), .o_out_fmap(xor_out[%s*24*24*bW:%s*24*24*bW-1]));\n"%(i,i,i+1,i,i+1))

f.write("\n")

for i in range(18):
    f.write("accbin1 ab_1_%s (.i_accbin_in(xor_out[%s*5*24*24*bW:%s*5*24*24*bW-1]), .kernel_offset(kernel_offset[%s*bW:%s*bW-1]), .o_accbin_out(conv_one_out[%s*24*24:%s*24*24-1]));\n"%(i,i,i+1,i,i+1,i,i+1))

f.write("\nendmodule")
f.close()

##################################################################################################

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
    f.write("poolchan1 p_1_%s (.clk, .rst_n, .i_pool_in(fmaps_in[%s*24*24:%s*24*24-1]), .o_pool_out(fmaps_out[%s*12*12:%s*12*12-1]);\n"%(i,i,i+1,i,i+1))

# for i in range(18):
#     f.write("poolchan1 p_1_%s (.clk, .rst_n, .pool_in(fmaps_in[%s][0:23][0:23]), .pool_out(fmaps_out[%s][0:11][0:11]));\n"%(i,i,i))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("conv2.sv", "w")

f.write("\
module conv2\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:18*12*12 -1] image         ,\n\
    input  logic [0:18*60*5*5-1] kernels       ,\n\
    input  logic [0:60*bW    -1] kernel_offset ,\n\
    output logic [0:60*8*8   -1] conv_one_out \n\
    );\n\
\n\
logic [0:18*60*24*24*bW-1] xor_out;\n\
")

f.write("\n")

for i in range(1080):
    f.write("convchan2 c_2_%s (.i_image(image[%s*12*12:%s*12*12*+1]), .i_kernel(kernels[%s*5*5:%s*5*5-1]), .o_out_fmap(xor_out[%s*24*24*bW:%s*24*24*bW-1]));\n"%(i,int(i/60),int(i/60)+1,i,i+1,i,i+1))

f.write("\n")

for i in range(60):
    f.write("accbin2 ab_2_%s (.i_accbin_in(xor_out[%s*18*24*24*bW:%s*18*24*24*bW-1]), .kernel_offset(kernel_offset[%s*bW:%s*bW-1]), .o_accbin_out(conv_one_out[%s*8*8:%s*8*8-1]));\n"%(i,i,i+1,i,i+1,i,i+1))

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
