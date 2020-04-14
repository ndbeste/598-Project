module count(
   input  logic clk,
   input  logic rst,
   output logic [15:0] count);


always_ff @(posedge clk) begin
    priority case(1'b1)
       ~rst: begin
          count <= 16'hFFFF;
       end
       1'b1: begin
          count <= count + 1'b1;
     end
   endcase
end
endmodule
