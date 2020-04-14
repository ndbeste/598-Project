p_dim = 2  # pool dimention
i_dim = 24 # input dimention
o_dim = int(i_dim/p_dim) # input dimention

for ox in range(o_dim):
    for oy in range(o_dim):
        ix1 = ox*2
        ix2 = ox*2 + 1
        iy1 = oy*2
        iy2 = oy*2 + 1
        if ix1 < 10:
            ix1 = str(ix1) + ' '
        if ix2 < 10:
            ix2 = str(ix2) + ' '
        if iy1 < 10:
            iy1 = str(iy1) + ' '
        if iy2 < 10:
            iy2 = str(iy2) + ' '
        print("assign pool_out[%s][%s] = ~&{pool_in[%s][%s][0], pool_in[%s][%s][0], pool_in[%s][%s][0], pool_in[%s][%s][0]};"%(ox,oy,ix1,iy1,ix1,iy2,ix2,iy1,ix2,iy2))
