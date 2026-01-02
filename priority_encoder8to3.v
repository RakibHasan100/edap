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
