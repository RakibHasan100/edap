module decoder2to4 (
  input  [1:0] A,
  output reg D0, D1, D2, D3
);

always @(*) begin
  D0=0; D1=0; D2=0; D3=0;

  case (A)
    2'b00: D0 = 1;
    2'b01: D1 = 1;
    2'b10: D2 = 1;
    2'b11: D3 = 1;
  endcase
end

endmodule
