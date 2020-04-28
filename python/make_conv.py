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

for i in range(90):
    f.write("convchan1 c_1_%s (.i_image(image), .i_kernel(kernels[%s*5*5:%s*5*5-1]), .o_out_fmap(xor_out[%s*24*24*bW:%s*24*24*bW-1]));\n"%(i,i,i+1,i,i+1))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("conv2.sv", "w")

f.write("\
module conv2\n\
    #( parameter bW = 8 )\n\
    (\n\
    input  logic [0:18*12*12 -1]      image         ,\n\
    input  logic [0:18*60*5*5-1]      kernels       ,\n\
    output logic [0:18*60*24*24*bW-1] xor_out \n\
    );\n\
")

f.write("\n")


for i in range(18):
    for j in range(60):
        f.write("convchan2 c_2_%s (.i_image(image[%s*12*12:%s*12*12-1]), .i_kernel(kernels[%s*5*5:%s*5*5-1]), .o_out_fmap(xor_out[%s*24*24*bW:%s*24*24*bW-1]));\n"%(i,i,i+1,i*j,i*j+1,i*j,i*j+1))

f.write("\nendmodule")
f.close()
