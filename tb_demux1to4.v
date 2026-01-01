module tb_demux1to4;

reg D;
reg [1:0] Sel;
wire Y0, Y1, Y2, Y3;

demux1to4 uut (
  .D(D), 
  .Sel(Sel), 
  .Y0(Y0), 
  .Y1(Y1), 
  .Y2(Y2), 
  .Y3(Y3));

initial begin
  $dumpfile("had.vcd");
  $dumpvars(0,tb_demux1to4);
  D = 1;

  Sel=2'b00; #10;
  Sel=2'b01; #10;
  Sel=2'b10; #10;
  Sel=2'b11; #10;

  $stop;
end

endmodule
