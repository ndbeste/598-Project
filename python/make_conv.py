f = open("conv1_10.sv", "w")

f.write("\
module conv1_10\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:28*28-1]         image           ,\n\
    input  logic [0:10*5*5-1]        kernels         , \n\
    output logic [0:10*24*24*bW-1]   xor_out  \n\
    );\n\
")

f.write('\n')

for i in range(10):
    f.write("convchan1 c_1_%s (.i_image(image), .i_kernel(kernels[%s*5*5:%s*5*5-1]), .o_out_fmap(xor_out[%s*24*24*bW:%s*24*24*bW-1]));\n"%(i,i,i+1,i,i+1))

f.write("\nendmodule")
f.close()

##################################################################################################
f = open("conv1.sv", "w")

f.write("\
module conv1\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:28*28-1]         image           ,\n\
    input  logic [0:90*5*5-1]        kernels         , \n\
    output logic [0:5*18*24*24*bW-1] xor_out  \n\
    );\n\
")

f.write('\n')

for i in range(9):
    f.write("conv1_10 c_1_10_%s (.i_image(image), .i_kernel(kernels[%s*5*5:%s*5*5-1]), .o_out_fmap(xor_out[%s*24*24*bW:%s*24*24*bW-1]));\n"%(i,10*i,10*(i+1),10*i,10*(i+1)))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("conv2_120.sv", "w")

f.write("\
module conv2_120\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:2*12*12    -1]    image         ,\n\
    input  logic [0:2*60*5*5   -1]    kernels       ,\n\
    output logic [0:2*60*8*8*bW-1]    xor_out \n\
    );\n\
")

f.write("\n")

for i in range(120):
    f.write("convchan2 c_2_%s (.i_image(image[%s*12*12:%s*12*12-1]), .i_kernel(kernels[%s*5*5:%s*5*5-1]), .o_out_fmap(xor_out[%s*8*8*bW:%s*8*8*bW-1]));\n"%(i,int(i/60),int(i/60)+1,i,i+1,i,i+1))


f.write("\nendmodule")
f.close()

##################################################################################################

f = open("conv2.sv", "w")

f.write("\
module conv2\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:18*12*12    -1]    image         ,\n\
    input  logic [0:18*60*5*5   -1]    kernels       ,\n\
    output logic [0:18*60*8*8*bW-1]    xor_out \n\
    );\n\
")

f.write("\n")

for i in range(9):
    f.write("conv2_120 c_2_120_%s (.i_image(image[%s*12*12:%s*12*12-1]), .i_kernel(kernels[%s*5*5:%s*5*5-1]), .o_out_fmap(xor_out[%s*8*8*bW:%s*8*8*bW-1]));\n"%(i,2*int(i/60),2*(int(i/60)+1),120*i,120*(i+1),120*i,120*(i+1)))

f.write("\nendmodule")
f.close()
