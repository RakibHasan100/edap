module tb_priority_encoder;

reg D0, D1, D2, D3;
wire [1:0] Y;

priority_encoder4to2 uut (
  .D0(D0), 
  .D1(D1), 
  .D2(D2), 
  .D3(D3), 
  .Y(Y)
);

initial begin
  
  $dumpfile("had.vcd");
  $dumpvars(0,tb_priority_encoder);
  
  {D3,D2,D1,D0} = 4'b0001; #10;
  {D3,D2,D1,D0} = 4'b0010; #10;
  {D3,D2,D1,D0} = 4'b0100; #10;
  {D3,D2,D1,D0} = 4'b1000; #10;
  {D3,D2,D1,D0} = 4'b1010; #10; 
  $stop;
end

endmodule
