/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = 8
     DEPTH = 32768
*/
module async_fifo_47 (
    input wclk,
    input wrst,
    input [7:0] din,
    input wput,
    output reg full,
    input rclk,
    input rrst,
    output reg [7:0] dout,
    input rget,
    output reg empty
  );
  
  localparam SIZE = 4'h8;
  localparam DEPTH = 16'h8000;
  
  
  localparam ADDR_SIZE = 4'hf;
  
  reg [14:0] M_waddr_d, M_waddr_q = 1'h0;
  reg [29:0] M_wsync_d, M_wsync_q = 1'h0;
  
  reg [14:0] M_raddr_d, M_raddr_q = 1'h0;
  reg [29:0] M_rsync_d, M_rsync_q = 1'h0;
  
  wire [8-1:0] M_ram_read_data;
  reg [1-1:0] M_ram_wclk;
  reg [15-1:0] M_ram_waddr;
  reg [8-1:0] M_ram_write_data;
  reg [1-1:0] M_ram_write_en;
  reg [1-1:0] M_ram_rclk;
  reg [15-1:0] M_ram_raddr;
  simple_dual_ram_64 #(.SIZE(4'h8), .DEPTH(16'h8000)) ram (
    .wclk(M_ram_wclk),
    .waddr(M_ram_waddr),
    .write_data(M_ram_write_data),
    .write_en(M_ram_write_en),
    .rclk(M_ram_rclk),
    .raddr(M_ram_raddr),
    .read_data(M_ram_read_data)
  );
  
  reg [14:0] waddr_gray;
  
  reg [14:0] wnext_gray;
  
  reg [14:0] raddr_gray;
  
  reg wrdy;
  reg rrdy;
  
  always @* begin
    M_rsync_d = M_rsync_q;
    M_wsync_d = M_wsync_q;
    M_raddr_d = M_raddr_q;
    M_waddr_d = M_waddr_q;
    
    M_ram_wclk = wclk;
    M_ram_rclk = rclk;
    M_ram_write_en = 1'h0;
    waddr_gray = (M_waddr_q >> 1'h1) ^ M_waddr_q;
    wnext_gray = ((M_waddr_q + 1'h1) >> 1'h1) ^ (M_waddr_q + 1'h1);
    raddr_gray = (M_raddr_q >> 1'h1) ^ M_raddr_q;
    M_rsync_d = {M_rsync_q[0+14-:15], waddr_gray};
    M_wsync_d = {M_wsync_q[0+14-:15], raddr_gray};
    wrdy = wnext_gray != M_wsync_q[15+14-:15];
    rrdy = raddr_gray != M_rsync_q[15+14-:15];
    full = !wrdy;
    empty = !rrdy;
    M_ram_waddr = M_waddr_q;
    M_ram_raddr = M_raddr_q;
    M_ram_write_data = din;
    if (wput && wrdy) begin
      M_waddr_d = M_waddr_q + 1'h1;
      M_ram_write_en = 1'h1;
    end
    if (rget && rrdy) begin
      M_raddr_d = M_raddr_q + 1'h1;
      M_ram_raddr = M_raddr_q + 1'h1;
    end
    dout = M_ram_read_data;
  end
  
  always @(posedge wclk) begin
    if (wrst == 1'b1) begin
      M_waddr_q <= 1'h0;
      M_wsync_q <= 1'h0;
    end else begin
      M_waddr_q <= M_waddr_d;
      M_wsync_q <= M_wsync_d;
    end
  end
  
  
  always @(posedge rclk) begin
    if (rrst == 1'b1) begin
      M_raddr_q <= 1'h0;
      M_rsync_q <= 1'h0;
    end else begin
      M_raddr_q <= M_raddr_d;
      M_rsync_q <= M_rsync_d;
    end
  end
  
endmodule