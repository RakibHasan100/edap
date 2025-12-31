module dff(
  input wire d,
  input wire clk,
  input wire rstn,
  output reg q
);
  always @(posedge clk or negedge rstn)
    begin
      if(!rstn) 
        q<=1'b0;
      else
        q<=d;
    end
endmodule
