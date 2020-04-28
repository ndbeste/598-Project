kernel_dim = 5;  # kernel dimention
image_dim = 28; # image dimention
fmap_dim  = 24;

f = open("convchan1.sv", "w")

f.write("\
typedef logic       d_image_t    [0:27][0:27];\n\
typedef logic       d_kernel_t   [0: 4][0: 4];\n\
typedef logic [7:0] d_fmap_out_t [0:23][0:23];\n\
\n\
module convchan1 \n\
    #( parameter bW = 8 )\n\
    ( \n\
    input  logic [0:28*28-1]    i_image    ,\n\
    input  logic [0:5*5-1]      i_kernel   ,\n\
    output logic [0:24*24*bW-1] o_out_fmap\n\
    );\n\
\n\
d_image_t    image    ;\n\
d_kernel_t   kernel   ;\n\
d_fmap_out_t out_fmap ;\n\
\n\
genvar i,j,k;\n\
for (i=0; i<28; i=i+1) begin\n\
    for (j=0; j<28; j=j+1) begin\n\
        assign image[i][j] = i_image[ 28*i + j ];\n\
    end\n\
end\n\
\n\
for (i=0; i<5; i=i+1) begin\n\
    for (j=0; j<5; j=j+1) begin\n\
        assign kernel[i][j] = i_kernel[ 5*i + j ];\n\
    end\n\
end\n\
\n\
for (i=0; i<24; i=i+1) begin\n\
    for (j=0; j<24; j=j+1) begin\n\
        for (k=0; k<bW; k=k+1) begin\n\
            assign o_out_fmap[ 24*8*i + 8*j + k ] = out_fmap[i][j][k];\n\
        end\n\
    end\n\
end\n\
")

f.write("\n")

for image_x in range(fmap_dim):
    for image_y in range(fmap_dim):
        conv_string = "assign out_fmap[%s][%s][bW-1:0] = "%(image_x, image_y)
        for kernel_x in range(kernel_dim):
            for kernel_y in range(kernel_dim):
                conv_x_coord = image_x + kernel_x
                conv_y_coord = image_y + kernel_y
                conv_string += "{7'd0,(kernel[%s][%s] ~^ image[%s][%s])}"%(kernel_x, kernel_y, conv_x_coord,conv_y_coord)
                if (kernel_x != kernel_dim-1) or (kernel_y != kernel_dim-1):
                    conv_string += " + "
        conv_string += ";\n"
        f.write(conv_string)

f.write("\nendmodule")
f.close()

##############################################################################################

image_dim = 12; # image dimention
fmap_dim  = 8;

f = open("convchan2.sv", "w")


f.write("\
typedef logic       d_image_t    [0:11][0:11];\n\
typedef logic       d_kernel_t   [0: 4][0: 4];\n\
typedef logic [7:0] d_fmap_out_t [0: 7][0: 7];\n\
\n\
module convchan2 \n\
    #( parameter bW = 8 )\n\
    ( \n\
    input  logic [0:12*12 -1]   i_image    ,\n\
    input  logic [0:5*5   -1]   i_kernel   ,\n\
    output logic [0:8*8*bW-1]   o_out_fmap\n\
    );\n\
\n\
d_image_t    image    ;\n\
d_kernel_t   kernel   ;\n\
d_fmap_out_t out_fmap ;\n\
\n\
genvar i,j,k;\n\
for (i=0; i<12; i=i+1) begin\n\
    for (j=0; j<12; j=j+1) begin\n\
        assign image[i][j] = i_image[ 12*i + j ];\n\
    end\n\
end\n\
\n\
for (i=0; i<5; i=i+1) begin\n\
    for (j=0; j<5; j=j+1) begin\n\
        assign kernel[i][j] = i_kernel[ 5*i + j ];\n\
    end\n\
end\n\
\n\
for (i=0; i<8; i=i+1) begin\n\
    for (j=0; j<8; j=j+1) begin\n\
        for (k=0; k<bW; k=k+1) begin\n\
            assign o_out_fmap[i][j][k] = out_fmap[ 8*bW*i + bW*j + k ];\n\
        end\n\
    end\n\
end\n\
")

f.write("\n")

for image_x in range(fmap_dim):
    for image_y in range(fmap_dim):
        conv_string = "assign out_fmap[%s][%s][bW-1:0] = "%(image_x, image_y)
        for kernel_x in range(kernel_dim):
            for kernel_y in range(kernel_dim):
                conv_x_coord = image_x + kernel_x
                conv_y_coord = image_y + kernel_y
                conv_string += "{7'd0,(kernel[%s][%s] ~^ image[%s][%s])}"%(kernel_x, kernel_y, conv_x_coord,conv_y_coord)
                if (kernel_x != kernel_dim-1) or (kernel_y != kernel_dim-1):
                    conv_string += " + "
        conv_string += ";\n"
        f.write(conv_string)

f.write("\nendmodule")
f.close()