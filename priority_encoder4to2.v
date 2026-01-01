module priority_encoder4to2 (
  input  D0, D1, D2, D3,
  output reg [1:0] Y
);

always @(*) begin
  if (D3)      Y = 2'b11;
  else if (D2) Y = 2'b10;
  else if (D1) Y = 2'b01;
  else if (D0) Y = 2'b00;
  else         Y = 2'b00;
end
endmodule
