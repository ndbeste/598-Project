kernel_dim = 5;  # kernel dimention
image_dim = 28; # image dimention
fmap_dim  = 24;

f = open("convchan1.sv", "w")

f.write("module convchan1( \n\
    input  logic signed image     [0:27][0:27],\n\
    input  logic        kernel    [0:4] [0:4],\n\
    output logic        out_fmap  [0:23][0:23]\n\
    );\n\
\n\
logic signed [bW-1:0] xor_sum       [0:23][0:23];\n\
logic signed [1   :0] signed_kernel [0: 4][0: 4];\n\
\n\n\
// Make kernel signed \n\n\
always_ff @(posedge clk) begin\n\
    if(~rst_n) begin\n\
        for(i=0; i<5; i=i+1) begin\n\
            for(j=0; j<5; j=j+1) begin\n\
                signed_kernel[i][j] <= 2'b00;\n\
            end\n\
        end\n\
    end else begin\n\
        for(i=0; i<5; i=i+1) begin\n\
            for(j=0; j<5; j=j+1) begin\n\
                signed_kernel[i][j] <= (kernel[i][j] == 1'b1) ? 2'b01 : 2'b11;\n\
            end\n\
        end\n\
    end\n\
end\n\n")

for image_x in range(fmap_dim):
    for image_y in range(fmap_dim):
        conv_string = "assign xor_sum[%s][%s] = "%(image_x, image_y)
        for kernel_x in range(kernel_dim):
            for kernel_y in range(kernel_dim):
                conv_x_coord = image_x + kernel_x
                conv_y_coord = image_y + kernel_y
                conv_string += "signed_kernel[%s][%s] ~^ image[%s][%s]"%(kernel_x, kernel_y, conv_x_coord,conv_y_coord)
                if (kernel_x != kernel_dim-1) or (kernel_y != kernel_dim-1):
                    conv_string += " + " # TODO: IS THIS SUPPOSED TO BE AN "OR" OR AN "ADD"?
        conv_string += ";\n"
        f.write(conv_string)

f.write("\n\n // output just the sign bit \n\n")

for ox in range(24):
    for oy in range(24):
        f.write("assign out_fmap[%s][%s] = xor_sum[%s][%s][0];\n"%(ox,oy,ox,oy))

f.write("\nendmodule")
f.close()

image_dim = 12; # image dimention
fmap_dim  = 8;

f = open("convchan2.sv", "w")

f.write("module convchan2( \n\
    input  logic signed image     [0:11][0:11],\n\
    input  logic        kernel    [0:4] [0:4],\n\
    output logic        out_fmap  [0:7][0:7]\n\
    );\n\
\n\
logic signed [bW-1:0] xor_sum       [0:7][0:7];\n\
logic signed [1   :0] signed_kernel [0:4][0:4];\n\
\n\n\
// Make kernel signed \n\n\
always_ff @(posedge clk) begin\n\
    if(~rst_n) begin\n\
        for(i=0; i<5; i=i+1) begin\n\
            for(j=0; j<5; j=j+1) begin\n\
                signed_kernel[i][j] <= 2'b00;\n\
            end\n\
        end\n\
    end else begin\n\
        for(i=0; i<5; i=i+1) begin\n\
            for(j=0; j<5; j=j+1) begin\n\
                signed_kernel[i][j] <= (kernel[i][j] == 1'b1) ? 2'b01 : 2'b11;\n\
            end\n\
        end\n\
    end\n\
end\n\n")

for image_x in range(fmap_dim):
    for image_y in range(fmap_dim):
        conv_string = "assign xor_sum[%s][%s] = "%(image_x, image_y)
        for kernel_x in range(kernel_dim):
            for kernel_y in range(kernel_dim):
                conv_x_coord = image_x + kernel_x
                conv_y_coord = image_y + kernel_y
                conv_string += "kernel[%s][%s] ~^ image[%s][%s]"%(kernel_x, kernel_y, conv_x_coord,conv_y_coord)
                if (kernel_x != kernel_dim-1) or (kernel_y != kernel_dim-1):
                    conv_string += " + "
        conv_string += ";\n"
        f.write(conv_string)

f.write("\n\n // output just the sign bit \n\n")

for ox in range(24):
    for oy in range(24):
        f.write("assign out_fmap[%s][%s] = xor_sum[%s][%s][0];\n"%(ox,oy,ox,oy))

f.write("\nendmodule")
f.close()