ECE128 Lab 5   Flip Flops and Latches 
Names: Madeline Grassi, Guranaad Kaur 
Date: 10/02/2026

Project description: This project/lab implements latches, flip flops, a counter, and a clock divider in Verilog using sequential logic.
The designs include an SR latch, an SR flip flop, a D flip flop with synchronous reset, a D flip flop with asynchronous reset, a T flip flop, a 3 bit counter built from T flip flops, and a clock divider that produces a 25 MHz clock from a 100 MHz input clock. Each module design was simulated in Vivado using its own testbench.

Instructions for simulation:
1. Open Vivado and create a new project.
2. Add the design files (sr_latch.v, sr_flip_flop.v, d_ff_sync_reset.v, d_ff_async_reset.v, t_flip_flop.v, counter_3bit.v, clock_divider.v) into the project, where it is labeled "Sources".
3. Add the testbenches (sr_latch_tb.v, sr_flip_flop_tb.v, d_ff_sync_reset_tb.v, d_ff_async_reset_tb.v, t_flip_flop_tb.v, counter_3bit_tb.v, clk_tb.v) where it is labeled "Simulation Sources".
4. Right click the testbench you want to simulate and select "Set as Top".
5. Run the simulation and select "Run Behavioral Simulation" when prompted.
6. A waveform will be generated and appear on screen. Check the outputs to make sure they match the expected values from the truth tables considering the testbench inputs.
