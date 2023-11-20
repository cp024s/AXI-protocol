# README for AXIS Interface Testbench

## Overview

This repository contains Verilog code for a simple testbench for an AXIS (Advanced eXtensible Interface) interface. The testbench includes modules for both the AXIS master (`axis_m`) and AXIS slave (`axis_s`). The purpose of this testbench is to simulate communication between a master and a slave using the AXIS protocol.

## Modules

### `axis_m`

#### Inputs

- `aclk`: Clock input.
- `areset_n`: Active-low asynchronous reset.
- `data`: Input data to be sent from the master to the slave.
- `send`: Control signal to initiate data transmission.
- `tready`: Indicates the readiness of the slave to accept data.

#### Outputs

- `tvalid`: Indicates the validity of the transmitted data.
- `tlast`: Indicates the last data word in a sequence.
- `tdata`: Transmitted data from the master to the slave.
- `finish`: Signal indicating the completion of the transaction.

### `axis_s`

#### Inputs

- `areset_n`: Active-low asynchronous reset.
- `aclk`: Clock input.
- `ready`: Signal indicating the slave is ready to accept data.
- `tvalid`: Indicates the validity of the received data.
- `tlast`: Indicates the last data word in a sequence.
- `tdata`: Received data from the master.

#### Outputs

- `data`: Output data from the slave.
- `tready`: Signal indicating the readiness of the slave to accept more data.
- `finish`: Signal indicating the completion of the transaction.

### Testbenches

The repository includes two testbenches:

1. **`tb_axis_m`**: Testbench for the AXIS master module.
    - Simulates the behavior of the AXIS master.
    - Sends data to the slave at specific time intervals.
    - Generates clock and reset signals.

2. **`tb_axis_s_m`**: Testbench for the combined simulation of AXIS master and slave modules.
    - Simulates the behavior of both the AXIS master and slave.
    - Controls the interaction between the master and slave.
    - Generates clock and reset signals.

## Running the Testbenches

1. **Simulation Environment:**
   - Ensure that you have a Verilog simulator installed (e.g., ModelSim, VCS).
   - Set up the simulator environment variables.

2. **Compile and Simulate:**
   - Compile the Verilog files: `axis_m.v`, `axis_s.v`, `tb_axis_m.v`, and `tb_axis_s_m.v`.
   - Run the simulation with the testbenches.

3. **View Results:**
   - Analyze simulation waveforms to verify the correctness of the AXIS communication.

## Simulation Steps

1. Initialize the clock and reset signals in the testbench.
2. Control the `send` and `ready` signals to initiate data transmission.
3. Observe the `tvalid`, `tlast`, `tdata`, and `finish` signals to track the progress of the communication.
4. Analyze the waveforms to ensure proper handshake and data transfer between the master and slave.

<hr>

Feel free to modify and use the code for your projects. If you find any issues or have suggestions, please create an issue in the repository.

Happy simulating!
