module tb_decoder2to4;

reg [1:0] A;
wire D0, D1, D2, D3;

decoder2to4 uut (
  .A(A), 
  .D0(D0), 
  .D1(D1), 
  .D2(D2), 
  .D3(D3)
);

initial begin
    
  $dumpfile("had.vcd");
  $dumpvars(0,tb_decoder2to4);
  
  A=2'b00; #10;
  A=2'b01; #10;
  A=2'b10; #10;
  A=2'b11; #10;
  $stop;
end

endmodule
