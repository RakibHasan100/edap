module tb_priority_encoder8to3;

  reg D0, D1, D2, D3, D4, D5, D6, D7;
  wire [2:0] Y;


  priority_encoder8to3 dut (
    .D0(D0), .D1(D1), .D2(D2), .D3(D3),
    .D4(D4), .D5(D5), .D6(D6), .D7(D7),
    .Y(Y)
  );

  initial begin

    $dumpfile("priority_encoder8to3.vcd");
    $dumpvars(0, tb_priority_encoder8to3);

    {D7,D6,D5,D4,D3,D2,D1,D0} = 8'b00000000;
    #10;
    D0 = 1; #10;   // expect Y = 000
    D1 = 1; #10;   // expect Y = 001
    D2 = 1; #10;   // expect Y = 010
    D3 = 1; #10;   // expect Y = 011

    {D7,D6,D5,D4,D3,D2,D1,D0} = 8'b00000000;
    #10;


    D4 = 1; #10;   // expect Y = 100
    D5 = 1; #10;   // expect Y = 101
    D6 = 1; #10;   // expect Y = 110
    D7 = 1; #10;   // expect Y = 111

    {D7,D6,D5,D4,D3,D2,D1,D0} = 8'b00000100; // D2 = 1
    #10;
    {D7,D6,D5,D4,D3,D2,D1,D0} = 8'b01000100; // D6 & D2 = 1
    #10;   // expect Y = 110 (D6 has higher priority)
    #10;
    $finish;
  end

endmodule
