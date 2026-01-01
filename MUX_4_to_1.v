module mux4to1 (
  input  I0, I1, I2, I3,
  input  [1:0] Sel,
  output reg F
);

always @(*) begin
  case (Sel)
    2'b00: F = I0;
    2'b01: F = I1;
    2'b10: F = I2;
    2'b11: F = I3;
    default: F = 0;
  endcase
end

endmodule
