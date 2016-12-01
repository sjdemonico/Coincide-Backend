/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input pulseA,
    input pulseB,
    input pulseC,
    input pulseD
  );
  
  
  
  reg rst;
  
  localparam CLKSPEED = 28'h8f0d180;
  
  integer i;
  
  wire [1-1:0] M_fast_CLK_OUT1;
  wire [1-1:0] M_fast_CLK_OUT2;
  fastclk fast (
    .CLK_IN1(clk),
    .CLK_OUT1(M_fast_CLK_OUT1),
    .CLK_OUT2(M_fast_CLK_OUT2)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(M_fast_CLK_OUT1),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_avr_spi_miso;
  wire [4-1:0] M_avr_spi_channel;
  wire [1-1:0] M_avr_tx;
  wire [1-1:0] M_avr_new_sample;
  wire [10-1:0] M_avr_sample;
  wire [4-1:0] M_avr_sample_channel;
  wire [1-1:0] M_avr_tx_busy;
  wire [8-1:0] M_avr_rx_data;
  wire [1-1:0] M_avr_new_rx_data;
  reg [1-1:0] M_avr_cclk;
  reg [1-1:0] M_avr_spi_mosi;
  reg [1-1:0] M_avr_spi_sck;
  reg [1-1:0] M_avr_spi_ss;
  reg [1-1:0] M_avr_rx;
  reg [4-1:0] M_avr_channel;
  reg [8-1:0] M_avr_tx_data;
  reg [1-1:0] M_avr_new_tx_data;
  reg [1-1:0] M_avr_tx_block;
  avr_interface_2 avr (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .cclk(M_avr_cclk),
    .spi_mosi(M_avr_spi_mosi),
    .spi_sck(M_avr_spi_sck),
    .spi_ss(M_avr_spi_ss),
    .rx(M_avr_rx),
    .channel(M_avr_channel),
    .tx_data(M_avr_tx_data),
    .new_tx_data(M_avr_new_tx_data),
    .tx_block(M_avr_tx_block),
    .spi_miso(M_avr_spi_miso),
    .spi_channel(M_avr_spi_channel),
    .tx(M_avr_tx),
    .new_sample(M_avr_new_sample),
    .sample(M_avr_sample),
    .sample_channel(M_avr_sample_channel),
    .tx_busy(M_avr_tx_busy),
    .rx_data(M_avr_rx_data),
    .new_rx_data(M_avr_new_rx_data)
  );
  wire [8-1:0] M_reg_tx_data;
  wire [1-1:0] M_reg_new_tx_data;
  wire [66-1:0] M_reg_regOut;
  reg [8-1:0] M_reg_rx_data;
  reg [1-1:0] M_reg_new_rx_data;
  reg [1-1:0] M_reg_tx_busy;
  reg [33-1:0] M_reg_regIn;
  reg_interface_3 L_reg (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .rx_data(M_reg_rx_data),
    .new_rx_data(M_reg_new_rx_data),
    .tx_busy(M_reg_tx_busy),
    .regIn(M_reg_regIn),
    .tx_data(M_reg_tx_data),
    .new_tx_data(M_reg_new_tx_data),
    .regOut(M_reg_regOut)
  );
  wire [1-1:0] M_tmr_maxval;
  wire [24-1:0] M_tmr_value;
  timer_4 tmr (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .maxval(M_tmr_maxval),
    .value(M_tmr_value)
  );
  reg [7:0] M_pins_d, M_pins_q = 1'h0;
  reg [7:0] M_pulse_length_d, M_pulse_length_q = 1'h0;
  reg [689:0] M_counts_d, M_counts_q = 1'h0;
  reg [689:0] M_count_store_d, M_count_store_q = 1'h0;
  reg M_poll_flag_d, M_poll_flag_q = 1'h0;
  wire [1-1:0] M_xdupA_out;
  reg [1-1:0] M_xdupA_pulse;
  duplicator_5 xdupA (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pulse(M_xdupA_pulse),
    .out(M_xdupA_out)
  );
  wire [1-1:0] M_xdupB_out;
  reg [1-1:0] M_xdupB_pulse;
  duplicator_5 xdupB (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pulse(M_xdupB_pulse),
    .out(M_xdupB_out)
  );
  wire [1-1:0] M_xdupC_out;
  reg [1-1:0] M_xdupC_pulse;
  duplicator_5 xdupC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pulse(M_xdupC_pulse),
    .out(M_xdupC_out)
  );
  wire [1-1:0] M_xdupD_out;
  reg [1-1:0] M_xdupD_pulse;
  duplicator_5 xdupD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pulse(M_xdupD_pulse),
    .out(M_xdupD_out)
  );
  wire [1-1:0] M_ydupA_out;
  reg [1-1:0] M_ydupA_pulse;
  duplicator_5 ydupA (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pulse(M_ydupA_pulse),
    .out(M_ydupA_out)
  );
  wire [1-1:0] M_ydupB_out;
  reg [1-1:0] M_ydupB_pulse;
  duplicator_5 ydupB (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pulse(M_ydupB_pulse),
    .out(M_ydupB_out)
  );
  wire [1-1:0] M_ydupC_out;
  reg [1-1:0] M_ydupC_pulse;
  duplicator_5 ydupC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pulse(M_ydupC_pulse),
    .out(M_ydupC_out)
  );
  wire [1-1:0] M_ydupD_out;
  reg [1-1:0] M_ydupD_pulse;
  duplicator_5 ydupD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pulse(M_ydupD_pulse),
    .out(M_ydupD_out)
  );
  wire [1-1:0] M_xcompA_incr;
  reg [4-1:0] M_xcompA_pins;
  comparator_13 xcompA (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompA_pins),
    .incr(M_xcompA_incr)
  );
  wire [1-1:0] M_xcompB_incr;
  reg [4-1:0] M_xcompB_pins;
  comparator_13 xcompB (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompB_pins),
    .incr(M_xcompB_incr)
  );
  wire [1-1:0] M_xcompC_incr;
  reg [4-1:0] M_xcompC_pins;
  comparator_13 xcompC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompC_pins),
    .incr(M_xcompC_incr)
  );
  wire [1-1:0] M_xcompD_incr;
  reg [4-1:0] M_xcompD_pins;
  comparator_13 xcompD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompD_pins),
    .incr(M_xcompD_incr)
  );
  wire [1-1:0] M_xcompAB_incr;
  reg [4-1:0] M_xcompAB_pins;
  comparator_13 xcompAB (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompAB_pins),
    .incr(M_xcompAB_incr)
  );
  wire [1-1:0] M_xcompAC_incr;
  reg [4-1:0] M_xcompAC_pins;
  comparator_13 xcompAC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompAC_pins),
    .incr(M_xcompAC_incr)
  );
  wire [1-1:0] M_xcompAD_incr;
  reg [4-1:0] M_xcompAD_pins;
  comparator_13 xcompAD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompAD_pins),
    .incr(M_xcompAD_incr)
  );
  wire [1-1:0] M_xcompBC_incr;
  reg [4-1:0] M_xcompBC_pins;
  comparator_13 xcompBC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompBC_pins),
    .incr(M_xcompBC_incr)
  );
  wire [1-1:0] M_xcompBD_incr;
  reg [4-1:0] M_xcompBD_pins;
  comparator_13 xcompBD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompBD_pins),
    .incr(M_xcompBD_incr)
  );
  wire [1-1:0] M_xcompCD_incr;
  reg [4-1:0] M_xcompCD_pins;
  comparator_13 xcompCD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompCD_pins),
    .incr(M_xcompCD_incr)
  );
  wire [1-1:0] M_xcompABC_incr;
  reg [4-1:0] M_xcompABC_pins;
  comparator_13 xcompABC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompABC_pins),
    .incr(M_xcompABC_incr)
  );
  wire [1-1:0] M_xcompABD_incr;
  reg [4-1:0] M_xcompABD_pins;
  comparator_13 xcompABD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompABD_pins),
    .incr(M_xcompABD_incr)
  );
  wire [1-1:0] M_xcompACD_incr;
  reg [4-1:0] M_xcompACD_pins;
  comparator_13 xcompACD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompACD_pins),
    .incr(M_xcompACD_incr)
  );
  wire [1-1:0] M_xcompBCD_incr;
  reg [4-1:0] M_xcompBCD_pins;
  comparator_13 xcompBCD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompBCD_pins),
    .incr(M_xcompBCD_incr)
  );
  wire [1-1:0] M_xcompABCD_incr;
  reg [4-1:0] M_xcompABCD_pins;
  comparator_13 xcompABCD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[0+3-:4]),
    .pins(M_xcompABCD_pins),
    .incr(M_xcompABCD_incr)
  );
  wire [1-1:0] M_ycompA_incr;
  reg [4-1:0] M_ycompA_pins;
  comparator_13 ycompA (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompA_pins),
    .incr(M_ycompA_incr)
  );
  wire [1-1:0] M_ycompB_incr;
  reg [4-1:0] M_ycompB_pins;
  comparator_13 ycompB (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompB_pins),
    .incr(M_ycompB_incr)
  );
  wire [1-1:0] M_ycompC_incr;
  reg [4-1:0] M_ycompC_pins;
  comparator_13 ycompC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompC_pins),
    .incr(M_ycompC_incr)
  );
  wire [1-1:0] M_ycompD_incr;
  reg [4-1:0] M_ycompD_pins;
  comparator_13 ycompD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompD_pins),
    .incr(M_ycompD_incr)
  );
  wire [1-1:0] M_ycompAB_incr;
  reg [4-1:0] M_ycompAB_pins;
  comparator_13 ycompAB (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompAB_pins),
    .incr(M_ycompAB_incr)
  );
  wire [1-1:0] M_ycompAC_incr;
  reg [4-1:0] M_ycompAC_pins;
  comparator_13 ycompAC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompAC_pins),
    .incr(M_ycompAC_incr)
  );
  wire [1-1:0] M_ycompAD_incr;
  reg [4-1:0] M_ycompAD_pins;
  comparator_13 ycompAD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompAD_pins),
    .incr(M_ycompAD_incr)
  );
  wire [1-1:0] M_ycompBC_incr;
  reg [4-1:0] M_ycompBC_pins;
  comparator_13 ycompBC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompBC_pins),
    .incr(M_ycompBC_incr)
  );
  wire [1-1:0] M_ycompBD_incr;
  reg [4-1:0] M_ycompBD_pins;
  comparator_13 ycompBD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompBD_pins),
    .incr(M_ycompBD_incr)
  );
  wire [1-1:0] M_ycompCD_incr;
  reg [4-1:0] M_ycompCD_pins;
  comparator_13 ycompCD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompCD_pins),
    .incr(M_ycompCD_incr)
  );
  wire [1-1:0] M_ycompABC_incr;
  reg [4-1:0] M_ycompABC_pins;
  comparator_13 ycompABC (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompABC_pins),
    .incr(M_ycompABC_incr)
  );
  wire [1-1:0] M_ycompABD_incr;
  reg [4-1:0] M_ycompABD_pins;
  comparator_13 ycompABD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompABD_pins),
    .incr(M_ycompABD_incr)
  );
  wire [1-1:0] M_ycompACD_incr;
  reg [4-1:0] M_ycompACD_pins;
  comparator_13 ycompACD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompACD_pins),
    .incr(M_ycompACD_incr)
  );
  wire [1-1:0] M_ycompBCD_incr;
  reg [4-1:0] M_ycompBCD_pins;
  comparator_13 ycompBCD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompBCD_pins),
    .incr(M_ycompBCD_incr)
  );
  wire [1-1:0] M_ycompABCD_incr;
  reg [4-1:0] M_ycompABCD_pins;
  comparator_13 ycompABCD (
    .clk(M_fast_CLK_OUT1),
    .rst(rst),
    .length(M_pulse_length_q[4+3-:4]),
    .pins(M_ycompABCD_pins),
    .incr(M_ycompABCD_incr)
  );
  
  always @* begin
    M_pins_d = M_pins_q;
    M_poll_flag_d = M_poll_flag_q;
    M_count_store_d = M_count_store_q;
    M_counts_d = M_counts_q;
    M_pulse_length_d = M_pulse_length_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_xdupA_pulse = pulseA;
    M_xdupB_pulse = pulseB;
    M_xdupC_pulse = pulseC;
    M_xdupD_pulse = pulseD;
    M_ydupA_pulse = pulseA;
    M_ydupB_pulse = pulseB;
    M_ydupC_pulse = pulseC;
    M_ydupD_pulse = pulseD;
    M_pins_d[0+0+0-:1] = M_xdupA_out;
    M_pins_d[0+1+0-:1] = M_xdupB_out;
    M_pins_d[0+2+0-:1] = M_xdupC_out;
    M_pins_d[0+3+0-:1] = M_xdupD_out;
    M_pins_d[4+0+0-:1] = M_ydupA_out;
    M_pins_d[4+1+0-:1] = M_ydupB_out;
    M_pins_d[4+2+0-:1] = M_ydupC_out;
    M_pins_d[4+3+0-:1] = M_ydupD_out;
    M_xcompA_pins = (M_pins_q[0+3-:4] | 4'he);
    M_xcompB_pins = (M_pins_q[0+3-:4] | 4'hd);
    M_xcompC_pins = (M_pins_q[0+3-:4] | 4'hb);
    M_xcompD_pins = (M_pins_q[0+3-:4] | 4'h7);
    M_xcompAB_pins = (M_pins_q[0+3-:4] | 4'hc);
    M_xcompAC_pins = (M_pins_q[0+3-:4] | 4'ha);
    M_xcompAD_pins = (M_pins_q[0+3-:4] | 4'h6);
    M_xcompBC_pins = (M_pins_q[0+3-:4] | 4'h9);
    M_xcompBD_pins = (M_pins_q[0+3-:4] | 4'h5);
    M_xcompCD_pins = (M_pins_q[0+3-:4] | 4'h3);
    M_xcompABC_pins = (M_pins_q[0+3-:4] | 4'h8);
    M_xcompABD_pins = (M_pins_q[0+3-:4] | 4'h4);
    M_xcompACD_pins = (M_pins_q[0+3-:4] | 4'h2);
    M_xcompBCD_pins = (M_pins_q[0+3-:4] | 4'h1);
    M_xcompABCD_pins = (M_pins_q[0+3-:4] | 4'h0);
    M_ycompA_pins = (M_pins_q[4+3-:4] | 4'he);
    M_ycompB_pins = (M_pins_q[4+3-:4] | 4'hd);
    M_ycompC_pins = (M_pins_q[4+3-:4] | 4'hb);
    M_ycompD_pins = (M_pins_q[4+3-:4] | 4'h7);
    M_ycompAB_pins = (M_pins_q[4+3-:4] | 4'hc);
    M_ycompAC_pins = (M_pins_q[4+3-:4] | 4'ha);
    M_ycompAD_pins = (M_pins_q[4+3-:4] | 4'h6);
    M_ycompBC_pins = (M_pins_q[4+3-:4] | 4'h9);
    M_ycompBD_pins = (M_pins_q[4+3-:4] | 4'h5);
    M_ycompCD_pins = (M_pins_q[4+3-:4] | 4'h3);
    M_ycompABC_pins = (M_pins_q[4+3-:4] | 4'h8);
    M_ycompABD_pins = (M_pins_q[4+3-:4] | 4'h4);
    M_ycompACD_pins = (M_pins_q[4+3-:4] | 4'h2);
    M_ycompBCD_pins = (M_pins_q[4+3-:4] | 4'h1);
    M_ycompABCD_pins = (M_pins_q[4+3-:4] | 4'h0);
    M_avr_cclk = cclk;
    M_avr_spi_ss = spi_ss;
    M_avr_spi_mosi = spi_mosi;
    M_avr_spi_sck = spi_sck;
    M_avr_rx = avr_tx;
    M_avr_channel = 4'hf;
    M_avr_tx_block = avr_rx_busy;
    spi_miso = M_avr_spi_miso;
    spi_channel = M_avr_spi_channel;
    avr_rx = M_avr_tx;
    M_reg_rx_data = M_avr_rx_data;
    M_reg_new_rx_data = M_avr_new_rx_data;
    M_avr_tx_data = M_reg_tx_data;
    M_avr_new_tx_data = M_reg_new_tx_data;
    M_reg_tx_busy = M_avr_tx_busy;
    M_reg_regIn[32+0-:1] = 1'h0;
    M_reg_regIn[0+31-:32] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if (M_xcompA_incr) begin
      M_counts_d[0+22-:23] = M_counts_q[0+22-:23] + 1'h1;
    end
    if (M_xcompB_incr) begin
      M_counts_d[23+22-:23] = M_counts_q[23+22-:23] + 1'h1;
    end
    if (M_xcompC_incr) begin
      M_counts_d[46+22-:23] = M_counts_q[46+22-:23] + 1'h1;
    end
    if (M_xcompD_incr) begin
      M_counts_d[69+22-:23] = M_counts_q[69+22-:23] + 1'h1;
    end
    if (M_xcompAB_incr) begin
      M_counts_d[92+22-:23] = M_counts_q[92+22-:23] + 1'h1;
    end
    if (M_xcompAC_incr) begin
      M_counts_d[115+22-:23] = M_counts_q[115+22-:23] + 1'h1;
    end
    if (M_xcompAD_incr) begin
      M_counts_d[138+22-:23] = M_counts_q[138+22-:23] + 1'h1;
    end
    if (M_xcompBC_incr) begin
      M_counts_d[161+22-:23] = M_counts_q[161+22-:23] + 1'h1;
    end
    if (M_xcompBD_incr) begin
      M_counts_d[184+22-:23] = M_counts_q[184+22-:23] + 1'h1;
    end
    if (M_xcompCD_incr) begin
      M_counts_d[207+22-:23] = M_counts_q[207+22-:23] + 1'h1;
    end
    if (M_xcompABC_incr) begin
      M_counts_d[230+22-:23] = M_counts_q[230+22-:23] + 1'h1;
    end
    if (M_xcompABD_incr) begin
      M_counts_d[253+22-:23] = M_counts_q[253+22-:23] + 1'h1;
    end
    if (M_xcompACD_incr) begin
      M_counts_d[276+22-:23] = M_counts_q[276+22-:23] + 1'h1;
    end
    if (M_xcompBCD_incr) begin
      M_counts_d[299+22-:23] = M_counts_q[299+22-:23] + 1'h1;
    end
    if (M_xcompABCD_incr) begin
      M_counts_d[322+22-:23] = M_counts_q[322+22-:23] + 1'h1;
    end
    if (M_ycompA_incr) begin
      M_counts_d[345+22-:23] = M_counts_q[345+22-:23] + 1'h1;
    end
    if (M_ycompB_incr) begin
      M_counts_d[368+22-:23] = M_counts_q[368+22-:23] + 1'h1;
    end
    if (M_ycompC_incr) begin
      M_counts_d[391+22-:23] = M_counts_q[391+22-:23] + 1'h1;
    end
    if (M_ycompD_incr) begin
      M_counts_d[414+22-:23] = M_counts_q[414+22-:23] + 1'h1;
    end
    if (M_ycompAB_incr) begin
      M_counts_d[437+22-:23] = M_counts_q[437+22-:23] + 1'h1;
    end
    if (M_ycompAC_incr) begin
      M_counts_d[460+22-:23] = M_counts_q[460+22-:23] + 1'h1;
    end
    if (M_ycompAD_incr) begin
      M_counts_d[483+22-:23] = M_counts_q[483+22-:23] + 1'h1;
    end
    if (M_ycompBC_incr) begin
      M_counts_d[506+22-:23] = M_counts_q[506+22-:23] + 1'h1;
    end
    if (M_ycompBD_incr) begin
      M_counts_d[529+22-:23] = M_counts_q[529+22-:23] + 1'h1;
    end
    if (M_ycompCD_incr) begin
      M_counts_d[552+22-:23] = M_counts_q[552+22-:23] + 1'h1;
    end
    if (M_ycompABC_incr) begin
      M_counts_d[575+22-:23] = M_counts_q[575+22-:23] + 1'h1;
    end
    if (M_ycompABD_incr) begin
      M_counts_d[598+22-:23] = M_counts_q[598+22-:23] + 1'h1;
    end
    if (M_ycompACD_incr) begin
      M_counts_d[621+22-:23] = M_counts_q[621+22-:23] + 1'h1;
    end
    if (M_ycompBCD_incr) begin
      M_counts_d[644+22-:23] = M_counts_q[644+22-:23] + 1'h1;
    end
    if (M_ycompABCD_incr) begin
      M_counts_d[667+22-:23] = M_counts_q[667+22-:23] + 1'h1;
    end
    if (M_tmr_maxval) begin
      M_count_store_d = M_counts_q;
      for (i = 1'h0; i < 5'h1e; i = i + 1) begin
        M_counts_d[(i)*23+22-:23] = 1'h0;
      end
      M_poll_flag_d = 1'h1;
    end
    if (M_reg_regOut[0+0-:1]) begin
      if (M_reg_regOut[1+0-:1]) begin
        
        case (M_reg_regOut[2+31-:32])
          7'h63: begin
            M_pulse_length_d[0+3-:4] = M_reg_regOut[34+0+3-:4];
          end
          7'h64: begin
            M_pulse_length_d[4+3-:4] = M_reg_regOut[34+0+3-:4];
          end
          default: begin
            M_poll_flag_d = M_reg_regOut[34+0+0-:1];
          end
        endcase
      end else begin
        
        case (M_reg_regOut[2+31-:32])
          1'h0: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[0+22-:23];
          end
          1'h1: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[23+22-:23];
          end
          2'h2: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[46+22-:23];
          end
          2'h3: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[69+22-:23];
          end
          3'h4: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[92+22-:23];
          end
          3'h5: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[115+22-:23];
          end
          3'h6: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[138+22-:23];
          end
          3'h7: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[161+22-:23];
          end
          4'h8: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[184+22-:23];
          end
          4'h9: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[207+22-:23];
          end
          4'ha: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[230+22-:23];
          end
          4'hb: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[253+22-:23];
          end
          4'hc: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[276+22-:23];
          end
          4'hd: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[299+22-:23];
          end
          4'he: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[322+22-:23];
          end
          4'hf: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[345+22-:23];
          end
          5'h10: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[368+22-:23];
          end
          5'h11: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[391+22-:23];
          end
          5'h12: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[414+22-:23];
          end
          5'h13: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[437+22-:23];
          end
          5'h14: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[460+22-:23];
          end
          5'h15: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[483+22-:23];
          end
          5'h16: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[506+22-:23];
          end
          5'h17: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[529+22-:23];
          end
          5'h18: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[552+22-:23];
          end
          5'h19: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[575+22-:23];
          end
          5'h1a: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[598+22-:23];
          end
          5'h1b: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[621+22-:23];
          end
          5'h1c: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[644+22-:23];
          end
          5'h1d: begin
            M_reg_regIn[0+31-:32] = M_count_store_q[667+22-:23];
          end
          default: begin
            M_reg_regIn[0+31-:32] = M_poll_flag_q;
          end
        endcase
        M_reg_regIn[32+0-:1] = 1'h1;
      end
    end
    led = M_counts_q[0+0+7-:8];
  end
  
  always @(posedge M_fast_CLK_OUT1) begin
    if (rst == 1'b1) begin
      M_pins_q <= 1'h0;
      M_pulse_length_q <= 1'h0;
      M_counts_q <= 1'h0;
      M_count_store_q <= 1'h0;
      M_poll_flag_q <= 1'h0;
    end else begin
      M_pins_q <= M_pins_d;
      M_pulse_length_q <= M_pulse_length_d;
      M_counts_q <= M_counts_d;
      M_count_store_q <= M_count_store_d;
      M_poll_flag_q <= M_poll_flag_d;
    end
  end
  
endmodule
