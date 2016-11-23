<?xml version="1.0" encoding="UTF-8"?>
<project name="Coincide_No_Stamps" board="Mojo V3" language="Lucid">
  <files>
    <src>timer.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>serialbuffer.luc</src>
    <src>duplicator.luc</src>
    <src>comparator.luc</src>
    <ucf>pins.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>spi_slave.luc</component>
    <component>async_fifo.luc</component>
    <component>uart_rx.luc</component>
    <component>cclk_detector.luc</component>
    <component>reset_conditioner.luc</component>
    <component>simple_dual_ram.v</component>
    <component>pipeline.luc</component>
    <component>uart_tx.luc</component>
    <component>avr_interface.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
    <core name="fastclk">
      <src>fastclk.v</src>
    </core>
    <core name="medclk">
      <src>medclk.v</src>
    </core>
  </files>
</project>
