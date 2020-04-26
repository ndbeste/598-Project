f = open("accbin1.sv", "w")

f.write("module accbin1\n")
f.write("    #( parameter bW = 8 )\n")
f.write("    (\n")
f.write("    input  logic [bW-1:0] accbin_in      [0:4][0:23][0:23],\n")
f.write("    input  logic [bW-1:0] kernel_offset,\n")
f.write("    output logic          accbin_out          [0:23][0:23]\n")
f.write("    );\n\n")

f.write("logic [bW-1:0]    sum_out [0:23][0:23];\n\n")

for ox in range(24):
    for oy in range(24):
        f.write("assign sum_out[%s][%s] = "%(ox,oy))
        for c in range(5):
            f.write("accbin_in[%s][%s][%s]"%(c,ox,oy))
            if c != 4:
                f.write(" + ")
        f.write(";\n")

f.write("\n")

# Compare sum_out with kernel_offset. conv_one_out = (sum_out > kernel_offset) ? 1'b1 : 1'b0;
for ox in range(24):
    for oy in range(24):
        f.write("assign accbin_out[%s][%s] = (sum_out[%s][%s] > kernel_offset) ? 1'b1 : 1'b0;\n"%(ox,oy,ox,oy))

f.write("\nendmodule")
f.close()

##################################################################################################

f = open("accbin2.sv", "w")

f.write("module accbin2\n")
f.write("    #( parameter bW = 8 )\n")
f.write("    (\n")
f.write("    input  logic [bW-1:0] accbin_in      [0:17][0:11][0:11],\n")
f.write("    input  logic [bW-1:0] kernel_offset,\n")
f.write("    output logic          accbin_out           [0:7 ][0: 7]\n")
f.write("    );\n\n")

f.write("logic [bW-1:0]    sum_out [0:23][0:23];\n\n")

for ox in range(12):
    for oy in range(12):
        f.write("assign sum_out[%s][%s] = "%(ox,oy))
        for c in range(18):
            f.write("accbin_in[%s][%s][%s]"%(c,ox,oy))
            if c != 17:
                f.write(" + ")
        f.write(";\n")

f.write("\n")

for ox in range(12):
    for oy in range(12):
        f.write("assign accbin_out[%s][%s] = (sum_out[%s][%s] > kernel_offset) ? 1'b1 : 1'b0;\n"%(ox,oy,ox,oy))

f.write("\nendmodule")
f.close()
