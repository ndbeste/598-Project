module top_popadd125();

logic [124:0] bits;
logic [6:0] cnt;

popadd125 #(125) dut(.*);


initial begin

#10;
bits = 124'd5;
#10;
$display(cnt);
#10;
bits = 124'd16;
#10;
$display(cnt);
#10;


$finish();
end


endmodule
