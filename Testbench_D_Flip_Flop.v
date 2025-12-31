module tb_dff;
  reg d,clk,rstn;
  wire q;
  dff uut(
    .d(d),
    .clk(clk),
    .rstn(rstn),
    .q(q)
  );
  initial clk=0;
  always #5 clk = ~ clk;
  
  initial begin
    $dumpfile("had.vcd");
    $dumpvars(0,tb_dff);
    
    rstn=0; d=0;
    #7 rstn =1;
    #10 d=1;
    #10 d=0;    
    #10 d=1;
    #20 $finish;
  end 
endmodule  
