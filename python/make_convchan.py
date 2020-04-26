kernel_dim = 5;  # kernel dimention
image_dim = 28; # image dimention
fmap_dim  = 24;

f = open("convchan1.sv", "w")

f.write("module convchan1 \n\
    #( parameter bW = 8 )\n\
    ( \n\
    input  logic          image     [0:27][0:27],\n\
    input  logic          kernel    [0:4] [0:4],\n\
    output logic [bW-1:0] out_fmap  [0:23][0:23]\n\
    );\n\n")

for image_x in range(fmap_dim):
    for image_y in range(fmap_dim):
        conv_string = "assign out_fmap[%s][%s] = "%(image_x, image_y)
        for kernel_x in range(kernel_dim):
            for kernel_y in range(kernel_dim):
                conv_x_coord = image_x + kernel_x
                conv_y_coord = image_y + kernel_y
                conv_string += "kernel[%s][%s] ~^ image[%s][%s]"%(kernel_x, kernel_y, conv_x_coord,conv_y_coord)
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

f.write("module convchan2\n\
    #( parameter bW = 8 )\n\
    ( \n\
    input  logic          image     [0:11][0:11],\n\
    input  logic          kernel    [0:4] [0:4],\n\
    output logic [bW-1:0] out_fmap  [0:7][0:7]\n\
    );\n\n")

for image_x in range(fmap_dim):
    for image_y in range(fmap_dim):
        conv_string = "assign out_fmap[%s][%s] = "%(image_x, image_y)
        for kernel_x in range(kernel_dim):
            for kernel_y in range(kernel_dim):
                conv_x_coord = image_x + kernel_x
                conv_y_coord = image_y + kernel_y
                conv_string += "kernel[%s][%s] ~^ image[%s][%s]"%(kernel_x, kernel_y, conv_x_coord,conv_y_coord)
                if (kernel_x != kernel_dim-1) or (kernel_y != kernel_dim-1):
                    conv_string += " + "
        conv_string += ";\n"
        f.write(conv_string)

f.write("\nendmodule")
f.close()