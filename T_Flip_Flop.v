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
      else begin
        case(d)
          1'b0: q<=q;
          1'b1: q<=~q;
        endcase
      end
    end
endmodule
