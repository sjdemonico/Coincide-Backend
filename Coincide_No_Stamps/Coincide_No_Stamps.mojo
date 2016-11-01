<?xml version="1.0" encoding="UTF-8"?>
<project name="Coincide_No_Stamps" board="Mojo V3" language="Lucid">
  <files>
    <src top="true">mojo_top.luc</src>
    <src>duplicator.luc</src>
    <src>comparator.luc</src>
    <ucf>pins.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>reg_interface.luc</component>
    <component>spi_slave.luc</component>
    <component>uart_rx.luc</component>
    <component>cclk_detector.luc</component>
    <component>reset_conditioner.luc</component>
    <component>avr_interface.luc</component>
    <component>uart_tx.luc</component>
    <component>pipeline.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
    <core name="fastclk">
      <src>fastclk.v</src>
    </core>
  </files>
</project>
