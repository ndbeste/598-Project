k_dim = 5;  # kernel dimention
n_dim = 28; # image dimention

kernal_indicies = list(range(k_dim*k_dim))

for image_x in range(n_dim - k_dim + 1):
    for image_y in range(n_dim - k_dim + 1):
        init_coord = (image_x, image_y)
        image_indicies = []
        for kernal_x in range(init_value[0], init_value[0] + k_dim):
            for kernal_y in range(init_value[1], init_value[1] + k_dim):
                image_indicies.append(kernal_y*n + kernal_x)
        for k, i in list(zip(kernal_indicies, image_indicies)):
            print("assign out = ")

k = 8
for i in range(k):
    for j in range(k):
        # v = i*k+j
        x = ""
        if v < 10:
            x = "   "
        elif v < 100:
            x = "  "
        elif v < 1000:
            x = " "
        print("", end=x)
    print()

i = 0;
for image_x in range(n_dim - k_dim + 1):
    for image_y in range(n_dim - k_dim + 1):
        index = kernal_y*n + kernal_x
        cur_string = "MODULENAME i" + str(i) + " ( .kernel, .image({"
        cur_string = cur_string + "image[" +




for i in list(zip(list(range(k)),list(range(k))))