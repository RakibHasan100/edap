module jk_master_slave(
    input wire j,
    input wire k,
    input wire clk,
    input wire rstn,
    output reg q
);

  reg master_q; 

  always @(j, k, clk, rstn) begin
    if (!rstn)
      master_q = 0;
    else if (clk) begin
      case({j,k})
        2'b00: master_q = master_q; 
        2'b01: master_q = 0;        
        2'b10: master_q = 1;       
        2'b11: master_q = ~master_q; 
      endcase
    end
  end

  always @(master_q, clk, rstn) begin
    if (!rstn)
      q = 0;
    else if (~clk)
      q = master_q;  
  end
