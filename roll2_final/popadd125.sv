module popadd125
#(parameter len = 125,
  parameter bW = $clog2(len))
(
input logic [len-1:0] bits,
output logic [bW-1:0] cnt);

genvar i;


    assign cnt = bits[0]+bits[1]+bits[2]+bits[3]+bits[4]+bits[5]+bits[6]+bits[7]+bits[8]+bits[9]+
bits[10]+bits[11]+bits[12]+bits[13]+bits[14]+bits[15]+bits[16]+bits[17]+bits[18]+bits[19]+
bits[20]+bits[21]+bits[22]+bits[23]+bits[24]+bits[25]+bits[26]+bits[27]+bits[28]+bits[29]+
bits[30]+bits[31]+bits[32]+bits[33]+bits[34]+bits[35]+bits[36]+bits[37]+bits[38]+bits[39]+
bits[40]+bits[41]+bits[42]+bits[43]+bits[44]+bits[45]+bits[46]+bits[47]+bits[48]+bits[49]+
bits[50]+bits[51]+bits[52]+bits[53]+bits[54]+bits[55]+bits[56]+bits[57]+bits[58]+bits[59]+
bits[60]+bits[61]+bits[62]+bits[63]+bits[64]+bits[65]+bits[66]+bits[67]+bits[68]+bits[69]+
bits[70]+bits[71]+bits[72]+bits[73]+bits[74]+bits[75]+bits[76]+bits[77]+bits[78]+bits[79]+
bits[80]+bits[81]+bits[82]+bits[83]+bits[84]+bits[85]+bits[86]+bits[87]+bits[88]+bits[89]+
bits[90]+bits[91]+bits[92]+bits[93]+bits[94]+bits[95]+bits[96]+bits[97]+bits[98]+bits[99]+
bits[100]+bits[101]+bits[102]+bits[103]+bits[104]+bits[105]+bits[106]+bits[107]+bits[108]+bits[109]+
bits[110]+bits[111]+bits[112]+bits[113]+bits[114]+bits[115]+bits[116]+bits[117]+bits[118]+bits[119]+
bits[120]+bits[121]+bits[122]+bits[123]+bits[124];



endmodule
