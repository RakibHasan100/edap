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




module priority_encoder8to3 (
  input  D0, D1, D2, D3, D4, D5, D6, D7,
  output reg [2:0] Y
);

  wire [1:0] Y_low;   
  wire [1:0] Y_high;  


  priority_encoder4to2 E1 (
    .D0(D0), .D1(D1), .D2(D2), .D3(D3),
    .Y(Y_low)
  );


  priority_encoder4to2 E2 (
    .D0(D4), .D1(D5), .D2(D6), .D3(D7),
    .Y(Y_high)
  );

  always @(*)
    begin
      if (D7 | D6 | D5 | D4) 
        begin
          Y[2]   = 1'b1;     
          Y[1:0] = Y_high; 
        end
      else 
        begin
          Y[2]   = 1'b0;     
          Y[1:0] = Y_low;  
        end
    end

endmodule


module priority_encoder16to4 (
  input  D0, D1, D2, D3, D4, D5, D6, D7,
  input  D8, D9, D10, D11, D12, D13, D14, D15,  
  output reg [3:0] Y
);

  wire [2:0] Y_low;   
  wire [2:0] Y_high;  


  priority_encoder8to3 E1 (
    .D0(D0), .D1(D1), .D2(D2), .D3(D3),
    .D4(D4), .D5(D5), .D6(D6), .D7(D7),    
    .Y(Y_low)
  );


  priority_encoder8to3 E2 (
    .D0(D8), .D1(D9), .D2(D10), .D3(D11),
    .D4(D12), .D5(D13), .D6(D14), .D7(D15), 
    .Y(Y_high)
  );

  always @(*)
    begin
      if (D8 | D9 | D10 | D11 | D12 | D13 | D14 | D15) 
        begin
          Y[3]   = 1'b1;     
          Y[2:0] = Y_high; 
        end
      else 
        begin
          Y[3]   = 1'b0;     
          Y[2:0] = Y_low;  
        end
    end

endmodule
