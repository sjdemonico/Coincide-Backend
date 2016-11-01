/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = $clog2(CLKSPEED)
     DIV = 0
     TOP = CLKSPEED-1
     UP = 1
*/
module counter_4 (
    input clk,
    input rst,
    output reg [27:0] value
  );
  
  localparam SIZE = 5'h1c;
  localparam DIV = 1'h0;
  localparam TOP = 29'h0bebc1ff;
  localparam UP = 1'h1;
  
  
  reg [27:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 29'h0bebc1ff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[0+27-:28];
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h1 && M_ctr_q == 29'h0bebc1ff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h1 && M_ctr_q == 1'h0) begin
        M_ctr_d = 29'h0bebc1ff;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
