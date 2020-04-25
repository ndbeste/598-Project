import math
output_nodes = 10
input_nodes = 960
weight_precision = 8

node_bw = math.ceil(math.log2(input_nodes))
after_bias_node_bw = node_bw - 1



print('logic [fI-1:0] xnor_result [9:0]; //will store 0/1 strings for all output nodes')
print('logic [sW-1:0] accumulation_result [9:0]; // will store total # of 1\'s observed')
print('logic [sW-1:0] accumulation_after_bias [9:0]; // will store total # of 1\'s - fI/2 -> which is like (x*2 - 960)/2 observed')
print('logic [sW+bW-2:0] output_nodes [9:0];')


for i in range(output_nodes):
    print('assign xnor_result[{0}] = (binary_weights[{0}] ~^ fan_in);'.format(i))

for i in range(output_nodes):
    print('assign accumulation_result[{0}] = xnor_result[{0}][0]'.format(i),*['+ xnor_result[{0}][{1}]'.format(i, input_bit) for input_bit in range(1, input_nodes)],';')
    
    
for i in range(output_nodes):
    print('assign accumulation_after_bias[{0}] = accumulation_result[{0}] - {1}\'d{2};'.format(i, node_bw-1, input_nodes//2))
    
for i in range(output_nodes):
    print('assign fan_out[{0}] = accumulation_after_bias[{0}] * weights[{0}];'.format(i))
    
    
for i in range(output_nodes):
    print('assign fan_out[{0}] = accumulation_after_bias[{0}][{3}] ? {1}\'d0 : (accumulation_after_bias[{0}][{2}:0] * weights[{0}]);'.format(i, weight_precision + node_bw - 1, node_bw-2, node_bw-1))
    
    
print('endmodule')

