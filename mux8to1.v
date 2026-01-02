
module mux8to1 (
  input  I0, I1, I2, I3,
  input  I4, I5, I6, I7,
  input  [2:0] Sel,   
  output reg F
);

  wire w1, w2;

  mux4to1 E1 (
    .I0(I0), .I1(I1), .I2(I2), .I3(I3),
    .Sel(Sel[1:0]),
    .F(w1)
  );

  mux4to1 E2 (
    .I0(I4), .I1(I5), .I2(I6), .I3(I7),
    .Sel(Sel[1:0]),
    .F(w2)
  );

  always @(*) begin
    if (Sel[2] == 1'b0)
      F = w1;   
    else
      F = w2;   
  end

endmodule
