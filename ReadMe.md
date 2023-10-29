# AXI Protocol Design

## Introduction

This README provides an overview of the design of an AMBA AXI4 slave with an operating frequency of 100MHz, operating on a 10ns clock cycle. The design includes support for a maximum of 256 data transfers per burst and is a critical component within the AMBA AXI4 system, consisting of both a master and a slave.

## System Overview

The AMBA AXI4 system comprises a master and a slave, as shown in Fig-1. The communication between the master and slave occurs through five distinct channels: write address channel, write data channel, read data channel, read address channel, and write response channel.

## AXI Protocol Overview

In the AXI protocol, all transfers are executed using a handshake mechanism, where data and control information are exchanged between the master and slave. This two-way flow control mechanism allows both the master and slave to control the rate at which data and control information move. Specifically, the source generates the VALID signal to indicate the availability of data or control information, and the destination generates the READY signal to indicate its readiness to accept data or control information. Transfer occurs only when both the VALID and READY signals are set to HIGH. Additionally, it's crucial to ensure there are no combinatorial paths between input and output signals on both master and slave interfaces.

---

## Channel Descriptions

### Address Write (AW) Channel

The AXI master drives write command signals only when the ARESETn signal is HIGH. Otherwise, it drives all signals as zero. The address write command signals driven by the AXI master include AWID, AWADDR, AWBURST, AWLEN, AWSIZE, AWCACHE, AWLOCK, and AWPROT, with AWVALID set to HIGH to indicate the validity of the driven signals. The AXI master only lowers the AWVALID signal after receiving the AWREADY signal, which is driven by the destination slave. This signal indicates that the slave has received the address write command signals, and if AWREADY is LOW, the AXI master retains the same values.

### Write Data (W) Channel

The AXI master drives Write Data signals after sending the write address command signals. It drives these signals when ARESETn is HIGH; otherwise, it sets all signals to zero. The AXI master sets WDATA with WVALID set to HIGH, holding the same value until it receives the READY signal. When WREADY is HIGH, the AXI master proceeds to drive the next WDATA. The AXI master drives the number of data transfers specified by AWLEN. When driving the last data, it sets WLAST to HIGH.

### Write Response (B) Channel

The destination slave drives Write Response signals when ARESETn is HIGH, and sets all signals to zero otherwise. The destination slave waits for the WLAST signal. Upon receiving the WLAST signal, it drives these response signals with BVALID set to HIGH. It maintains this value until it receives the BREADY signal from the AXI master. If BREADY is HIGH, the destination slave resets all signals to zero at the next positive edge of ACLK; otherwise, it retains the same value.

### Address Read (AR) Channel

The AXI master drives command signals when ARESETn is HIGH and sets all signals to zero otherwise. The address read command signals driven by the AXI master include ARID, ARADDR, ARBURST, ARLEN, ARSIZE, ARCACHE, ARLOCK, and ARPROT, with ARVALID set to HIGH to indicate the validity of the driven signals. The AXI master only lowers the ARVALID signal after receiving the ARREADY signal, driven by the source slave. This signal indicates that the source slave has received the address read command signals. If ARREADY is LOW, the AXI master retains the same values.

### Read Data (R) Channel

The source slave drives Read Data signals after receiving the read command signals. It drives these signals when ARESETn is HIGH; otherwise, it sets all signals to zero. The source slave sets RDATA with RVALID set to HIGH, holding the same value until it receives the RREADY signal. When RREADY is HIGH, the source slave proceeds to drive the next RDATA. The source slave drives the number of data transfers specified by ARLEN. When driving the last data, it sets RLAST to HIGH.

---
