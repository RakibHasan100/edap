module tb_jk_ms;
  reg j, k, clk, rstn;
  wire q;

  jk_master_slave uut(
    .j(j),
    .k(k),
    .clk(clk),
    .rstn(rstn),
    .q(q)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    rstn = 0; j = 0; k = 0;
    #10 rstn = 1; // Release reset

    #10 j = 1; k = 0; // Set
    #10 j = 0; k = 1; // Reset
    #10 j = 1; k = 1; // Toggle
    #10 j = 0; k = 0; // Hold
    #20 $finish;
  end

  // Dump waveform
  initial begin
    $dumpfile("jk_ms.vcd");
    $dumpvars(0, tb_jk_ms);
  end
endmodule
