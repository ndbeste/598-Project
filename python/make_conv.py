f = open("conv1.sv", "w")

f.write("module conv1(\n")
f.write("    input  logic image           [0:27][0:27],\n")
f.write("    input  logic kernels         [0:99][0: 4][0: 4],\n")
f.write("    output logic conv_one_out    [0:19][0:23][0:23]\n")
f.write("    );\n\n")

f.write("logic       xor_out [0:99][0:23][0:23];\n")
f.write("logic [2:0] sum_out [0:19][0:23][0:23];\n\n")

for i in range(100):
    f.write("convchan1 c_1_%s (.image, .kernel(kernels[%s]), .out_fmap(xor_out[%s]));\n"%(i,i,i))

f.write("\n")

for ox in range(24):
    for oy in range(24):
        for c in range(20):
            f.write("assign sum_out[%s][%s][%s] = "%(c,ox,oy))
            for n in range(5):
                f.write("xor_out[%s][%s][%s]"%(c*5+n,ox,oy))
                if n != 4:
                    f.write(" + ")
            f.write(";\n")
        f.write("\n")

# TODO Split this into a separate module if time.

f.write("\n")

for ox in range(24):
    for oy in range(24):
        for c in range(20):
            f.write("assign conv_one_out[%s][%s][%s] = (sum_out[%s][%s][%s] >= 3'b011) ? 1'b1: 1'b0;\n"%(c,ox,oy,c,ox,oy))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("pool1.sv", "w")

f.write("module pool1(\n")
f.write("    input  logic           fmaps_in          [0:19][0:23][0:23],\n")
f.write("    output logic           fmaps_out         [0:19][0:11][0:11]\n")
f.write("    );\n")

for i in range(20):
    f.write("poolchan1 p_1_%s (.pool_in(fmaps_in[%s]), .pool_out(fmaps_out[%s]));\n"%(i,i,i))

f.write("endmodule")
f.close()

##################################################################################################

f = open("conv2.sv", "w")

f.write("module conv2(\n")
f.write("    input  logic pool_one_out    [0:  19][0:11][0:11],\n")
f.write("    input  logic kernels         [0:1199][0: 4][0: 4],\n")
f.write("    output logic conv_two_out    [0:  59][0: 7][0: 7]\n")
f.write("    );\n\n")

f.write("logic       xor_out [0:1199][0:23][0:23];\n")
f.write("logic [4:0] sum_out [0:  59][0:23][0:23];\n\n")


for i in range(1200):
    f.write("convchan2 c_2_%s (.image, .kernel(kernels[%s]), .conv_out(xor_out[%s]));\n"%(i,i,i))

f.write("\n")

for ox in range(12):
    for oy in range(12):
        for c in range(60):
            f.write("assign sum_out[%s][%s][%s] = "%(c,ox,oy))
            for n in range(20):
                f.write("xor_out[%s][%s][%s]"%(c*20+n,ox,oy))
                if n != 4:
                    f.write(" + ")
            f.write(";\n")
        f.write("\n")

for ox in range(24):
    for oy in range(24):
        for c in range(60):
            f.write("assign conv_one_out[%s][%s][%s] = (sum_out[%s][%s][%s] >= 5'b01010) ? 1'b1: 1'b0;\n"%(c,ox,oy,c,ox,oy))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("pool2.sv", "w")

f.write("module pool2(\n")
f.write("    input  logic           fmaps_in          [0:19][0:23][0:23],\n")
f.write("    output logic           fmaps_out         [0:19][0:11][0:11]\n")
f.write("    );\n")

for i in range(20):
    f.write("poolchan2 p_2_%s (.pool_in(fmaps_in[%s]), .pool_out(fmaps_out[%s]));\n"%(i,i,i))

f.write("endmodule")
f.close()
