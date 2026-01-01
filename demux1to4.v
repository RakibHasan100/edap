module demux1to4 (
  input  D,
  input  [1:0] Sel,
  output reg Y0, Y1, Y2, Y3
);

always @(*) begin
  Y0=0; Y1=0; Y2=0; Y3=0;

  case (Sel)
    2'b00: Y0 = D;
    2'b01: Y1 = D;
    2'b10: Y2 = D;
    2'b11: Y3 = D;
  endcase
end

endmodule
