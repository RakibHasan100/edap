module tb_priority_encoder16to4;

  reg D0,D1,D2,D3,D4,D5,D6,D7;
  reg D8,D9,D10,D11,D12,D13,D14,D15;
  wire [3:0] Y;

  priority_encoder16to4 dut (
    .D0(D0), .D1(D1), .D2(D2), .D3(D3),
    .D4(D4), .D5(D5), .D6(D6), .D7(D7),
    .D8(D8), .D9(D9), .D10(D10), .D11(D11),
    .D12(D12), .D13(D13), .D14(D14), .D15(D15),
    .Y(Y)
  );

  initial begin
    $dumpfile("priority_encoder16to4.vcd");
    $dumpvars(0, tb_priority_encoder16to4);

    // Test all lower half individually
    {D15,D14,D13,D12,D11,D10,D9,D8,D7,D6,D5,D4,D3,D2,D1,D0} = 16'b0;
    #10; D0=1; #10; D0=0; D1=1; #10; D1=0; D2=1; #10; D2=0; D3=1; #10; D3=0;
    
    // Test upper half individually
    #10; D8=1; #10; D8=0; D9=1; #10; D9=0; D10=1; #10; D10=0; D11=1; #10; D11=0;
    #10; D12=1; #10; D12=0; D13=1; #10; D13=0; D14=1; #10; D14=0; D15=1; #10; D15=0;

    // Test multiple inputs at once
    #10; {D15,D14,D13,D12,D11,D10,D9,D8,D7,D6,D5,D4,D3,D2,D1,D0} = 16'b0100_0010_0000_0100;
    // Expect Y = 1101 (D13 has highest priority)
    
    #10;
    $finish;
  end

endmodule

