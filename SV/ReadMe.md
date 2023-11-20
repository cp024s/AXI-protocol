1. **`tb_axis_m` Testbench:**
   - Simulates the behavior of the AXIS master.
   - Generates clock and reset signals.
   - Controls the `send` signal to initiate data transmission.
   - Observes the `tvalid`, `tlast`, `tdata`, and `finish` signals.

2. **`tb_axis_s_m` Testbench:**
   - Simulates the combined behavior of AXIS master and slave.
   - Controls the `send` and `ready` signals to manage data transfer.
   - Observes the `tvalid`, `tlast`, `tdata`, `tready`, `data`, and `finish` signals.
