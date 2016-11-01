/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     PULSE_LEN = PULSE_LEN
*/
module duplicator_5 (
    input clk,
    input rst,
    input pulse,
    output reg out
  );
  
  localparam PULSE_LEN = 2'h2;
  
  
  wire [1-1:0] M_edge_out;
  reg [1-1:0] M_edge_in;
  edge_detector_28 L_edge (
    .clk(clk),
    .in(M_edge_in),
    .out(M_edge_out)
  );
  
  reg [1:0] M_ctr_d, M_ctr_q = 1'h0;
  
  wire [(1'h1+0)-1:0] M_sync_out;
  reg [(1'h1+0)-1:0] M_sync_in;
  
  genvar GEN_sync0;
  generate
  for (GEN_sync0=0;GEN_sync0<1'h1;GEN_sync0=GEN_sync0+1) begin: sync_gen_0
    pipeline_29 sync (
      .clk(clk),
      .in(M_sync_in[GEN_sync0*(1)+(1)-1-:(1)]),
      .out(M_sync_out[GEN_sync0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  
  localparam LISTEN_state = 1'd0;
  localparam PULSE_state = 1'd1;
  
  reg M_state_d, M_state_q = LISTEN_state;
  
  always @* begin
    M_state_d = M_state_q;
    M_ctr_d = M_ctr_q;
    
    out = 1'h0;
    M_sync_in = pulse;
    M_edge_in = M_sync_out;
    
    case (M_state_q)
      LISTEN_state: begin
        if (M_edge_out) begin
          M_state_d = PULSE_state;
        end
      end
      PULSE_state: begin
        if (M_ctr_q == 2'h2) begin
          M_ctr_d = 1'h0;
          out = 1'h0;
          M_state_d = LISTEN_state;
        end else begin
          out = 1'h1;
          M_ctr_d = M_ctr_q + 1'h1;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
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
