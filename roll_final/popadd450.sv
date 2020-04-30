module popadd450
#(parameter len = 450,
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
bits[120]+bits[121]+bits[122]+bits[123]+bits[124]+bits[125]+bits[126]+bits[127]+bits[128]+bits[129]+
bits[130]+bits[131]+bits[132]+bits[133]+bits[134]+bits[135]+bits[136]+bits[137]+bits[138]+bits[139]+
bits[140]+bits[141]+bits[142]+bits[143]+bits[144]+bits[145]+bits[146]+bits[147]+bits[148]+bits[149]+
bits[150]+bits[151]+bits[152]+bits[153]+bits[154]+bits[155]+bits[156]+bits[157]+bits[158]+bits[159]+
bits[160]+bits[161]+bits[162]+bits[163]+bits[164]+bits[165]+bits[166]+bits[167]+bits[168]+bits[169]+
bits[170]+bits[171]+bits[172]+bits[173]+bits[174]+bits[175]+bits[176]+bits[177]+bits[178]+bits[179]+
bits[180]+bits[181]+bits[182]+bits[183]+bits[184]+bits[185]+bits[186]+bits[187]+bits[188]+bits[189]+
bits[190]+bits[191]+bits[192]+bits[193]+bits[194]+bits[195]+bits[196]+bits[197]+bits[198]+bits[199]+
bits[200]+bits[201]+bits[202]+bits[203]+bits[204]+bits[205]+bits[206]+bits[207]+bits[208]+bits[209]+
bits[210]+bits[211]+bits[212]+bits[213]+bits[214]+bits[215]+bits[216]+bits[217]+bits[218]+bits[219]+
bits[220]+bits[221]+bits[222]+bits[223]+bits[224]+bits[225]+bits[226]+bits[227]+bits[228]+bits[229]+
bits[230]+bits[231]+bits[232]+bits[233]+bits[234]+bits[235]+bits[236]+bits[237]+bits[238]+bits[239]+
bits[240]+bits[241]+bits[242]+bits[243]+bits[244]+bits[245]+bits[246]+bits[247]+bits[248]+bits[249]+
bits[250]+bits[251]+bits[252]+bits[253]+bits[254]+bits[255]+bits[256]+bits[257]+bits[258]+bits[259]+
bits[260]+bits[261]+bits[262]+bits[263]+bits[264]+bits[265]+bits[266]+bits[267]+bits[268]+bits[269]+
bits[270]+bits[271]+bits[272]+bits[273]+bits[274]+bits[275]+bits[276]+bits[277]+bits[278]+bits[279]+
bits[280]+bits[281]+bits[282]+bits[283]+bits[284]+bits[285]+bits[286]+bits[287]+bits[288]+bits[289]+
bits[290]+bits[291]+bits[292]+bits[293]+bits[294]+bits[295]+bits[296]+bits[297]+bits[298]+bits[299]+
bits[300]+bits[301]+bits[302]+bits[303]+bits[304]+bits[305]+bits[306]+bits[307]+bits[308]+bits[309]+
bits[310]+bits[311]+bits[312]+bits[313]+bits[314]+bits[315]+bits[316]+bits[317]+bits[318]+bits[319]+
bits[320]+bits[321]+bits[322]+bits[323]+bits[324]+bits[325]+bits[326]+bits[327]+bits[328]+bits[329]+
bits[330]+bits[331]+bits[332]+bits[333]+bits[334]+bits[335]+bits[336]+bits[337]+bits[338]+bits[339]+
bits[340]+bits[341]+bits[342]+bits[343]+bits[344]+bits[345]+bits[346]+bits[347]+bits[348]+bits[349]+
bits[350]+bits[351]+bits[352]+bits[353]+bits[354]+bits[355]+bits[356]+bits[357]+bits[358]+bits[359]+
bits[360]+bits[361]+bits[362]+bits[363]+bits[364]+bits[365]+bits[366]+bits[367]+bits[368]+bits[369]+
bits[370]+bits[371]+bits[372]+bits[373]+bits[374]+bits[375]+bits[376]+bits[377]+bits[378]+bits[379]+
bits[380]+bits[381]+bits[382]+bits[383]+bits[384]+bits[385]+bits[386]+bits[387]+bits[388]+bits[389]+
bits[390]+bits[391]+bits[392]+bits[393]+bits[394]+bits[395]+bits[396]+bits[397]+bits[398]+bits[399]+
bits[400]+bits[401]+bits[402]+bits[403]+bits[404]+bits[405]+bits[406]+bits[407]+bits[408]+bits[409]+
bits[410]+bits[411]+bits[412]+bits[413]+bits[414]+bits[415]+bits[416]+bits[417]+bits[418]+bits[419]+
bits[420]+bits[421]+bits[422]+bits[423]+bits[424]+bits[425]+bits[426]+bits[427]+bits[428]+bits[429]+
bits[430]+bits[431]+bits[432]+bits[433]+bits[434]+bits[435]+bits[436]+bits[437]+bits[438]+bits[439]+
bits[440]+bits[441]+bits[442]+bits[443]+bits[444]+bits[445]+bits[446]+bits[447]+bits[448]+bits[449];



endmodule
