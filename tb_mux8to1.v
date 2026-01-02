module tb_mux8to1;

  reg I0, I1, I2, I3, I4, I5, I6, I7;
  reg [2:0] Sel;
  wire F;


  mux8to1 dut (
    .I0(I0), .I1(I1), .I2(I2), .I3(I3),
    .I4(I4), .I5(I5), .I6(I6), .I7(I7),
    .Sel(Sel),
    .F(F)
  );

  initial begin
    $dumpfile("mux8to1.vcd");
    $dumpvars(0, tb_mux8to1);



    // Test multiple inputs high, MSB selection priority
    {I7,I6,I5,I4,I3,I2,I1,I0} = 8'b10101010;
    Sel = 3'b000; #10;  // expect F = I0 = 0
    Sel = 3'b001; #10;  // expect F = I1 = 1
    Sel = 3'b010; #10;  // expect F = I2 = 0
    Sel = 3'b011; #10;  // expect F = I3 = 1
    Sel = 3'b100; #10;  // expect F = I4 = 0
    Sel = 3'b101; #10;  // expect F = I5 = 1
    Sel = 3'b110; #10;  // expect F = I6 = 0
    Sel = 3'b111; #10;  // expect F = I7 = 1

    #10;
    $finish;
  end

endmodule
