f = open("conv1.sv", "w")

f.write("module conv1\n")
f.write("    #( parameter bW = 8 )\n")
f.write("    (\n")
f.write("    input  logic           image           [0:27][0:27],\n")
f.write("    input  logic           kernels         [0:89][0: 4][0: 4],\n")
f.write("    input  logic [bW-1:0]  kernel_offset   [0:17],\n")
f.write("    output logic           conv_one_out    [0:17][0:23][0:23]\n")
f.write("    );\n\n")

f.write("logic [bW-1:0] xor_out [0:89][0:23][0:23];\n\n")

for i in range(90):
    f.write("convchan1 c_1_%s (.image, .kernel(kernels[%s]), .out_fmap(xor_out[%s]));\n"%(i,i,i))

f.write("\n")

for i in range(18):
    f.write("accbin2 ab_2_%s (.accbin_in(xor_out[%s:%s]), .kernel_offset(kernel_offset[%s]), .accbin_out(conv_one_out[%s]));\n"%(i,i*5,i*5+4,i,i))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("pool1.sv", "w")

f.write("module pool1(\n")
f.write("    input  logic clk,\n")
f.write("    input  logic rst_n,\n")
f.write("    input  logic fmaps_in  [0:17][0:23][0:23],\n")
f.write("    output logic fmaps_out [0:17][0:11][0:11]\n")
f.write("    );\n")

for i in range(18):
    f.write("poolchan1 p_1_%s (.clk, .rst_n, .pool_in(fmaps_in[%s]), .pool_out(fmaps_out[%s]));\n"%(i,i,i))

f.write("endmodule")
f.close()

##################################################################################################

f = open("conv2.sv", "w")

f.write("module conv2(\n")
f.write("    input  logic           pool_one_out              [0:  17][0:11][0:11],\n")
f.write("    input  logic           kernels                   [0:1079][0: 4][0: 4],\n")
f.write("    input  logic [bW-1:0]  kernel_offset             [0:  59],\n")
f.write("    output logic           conv_two_out              [0:  59][0: 7][0: 7]\n")
f.write("    );\n\n")

f.write("logic       xor_out [0:1079][0:23][0:23];\n\n")

for i in range(1080):
    f.write("convchan2 c_2_%s (.image, .kernel(kernels[%s]), .conv_out(xor_out[%s]));\n"%(i,i,i))

f.write("\n")

for i in range(60):
    f.write("accbin2 ab_2_%s (.accbin_in(xor_out[%s:%s]), .kernel_offset(kernel_offset[%s]), .accbin_out(conv_one_out[%s]));\n"%(i,i*60,i*60+19,i,i))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("pool2.sv", "w")

f.write("module pool2(\n")
f.write("    input  logic clk,\n")
f.write("    input  logic rst_n,\n")
f.write("    input  logic fmaps_in  [0:59][0:7][0:7],\n")
f.write("    output logic fmaps_out [0:59][0:3][0:3]\n")
f.write("    );\n")

for i in range(60):
    f.write("poolchan2 p_2_%s (.clk, .rst_n, .pool_in(fmaps_in[%s]), .pool_out(fmaps_out[%s]));\n"%(i,i,i))

f.write("endmodule")
f.close()
