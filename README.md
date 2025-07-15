# 1011 Sequence Detector (Mealy & Moore FSMs)

A Verilog implementation of a **1011 pattern detector** written in both *Mealy* and *Moore* styles, with test-benches, waveforms, and Vivado project files for quick simulation and synthesis.

## Repository Map

| Path                        | Description                                                                 |
|-----------------------------|-----------------------------------------------------------------------------|
| mealy_overlapping.v       | Mealy FSM that *allows* overlapping pattern occurrences                   |
| mealy_non-overlapping.v   | Mealy FSM that *blocks* overlapping matches                               |
| moore_overlapping.v       | Moore FSM that *allows* overlaps                                          |
| moore_non-overlapping.v   | Moore FSM that *blocks* overlaps                                          |
| testbench_*               | Four self-checking benches—one per design variant                           |
| *.png                     | Timing & schematic screenshots exported from Vivado                         |
| 1011 Sequence Detector.xpr| Vivado 2018.2 project for out-of-the-box simulation                         |
| README.md                 | (You are here) project documentation                                        |

## Theory

| Model    | Output depends on         | Typical advantages                     |
|----------|--------------------------|----------------------------------------|
| *Mealy| Current **state + input*| Fewer states, faster response          |
| *Moore| **State only*           | Glitch-free, easier timing closure     |

Both variants in this repo are written in a *one-hot* style using parameter-encoded states for clear readability.

## Quick-Start

1. *Clone*
git clone https://github.com/NandanLenka/1011-Sequence-Detector.git
cd 1011-Sequence-Detector

text

2. *Open* the .xpr in *Xilinx Vivado*  
(ModelSim / Icarus + GTKWave are equally fine—just add the source & TB files).

3. *Run simulation*  
All four benches apply the test vector **1011011** and print y on every clock edge. Overlapping versions should detect *two* matches; non-overlapping versions detect *one*.

4. *Inspect waveforms*  
Compare your traces with the reference images:

- Mealy Overlapping.png
- Mealy Non-overlapping.png
- Moore Overlapping.png
- Moore Non-overlapping.png

## Using the Modules

module top;
reg clk = 0, reset = 1, x;
wire y;

// pick any of the four variants
mealy_overlapping dut (.clk(clk), .reset(reset), .x(x), .y(y));

always #5 clk = ~clk; // 100 MHz
initial begin
#12 reset = 0;
repeat(100) begin
x = $random; #10;
end
end
endmodule

text

Active-high synchronous reset is used throughout.

## Results Snapshot

The table shows the number of states and whether overlapping matches are reported.

| Variant                      | States | Overlap? | First valid y pulse         |
|------------------------------|--------|----------|-------------------------------|
| Mealy – Overlapping          | 4      | ✅       | 1 cycle after last bit        |
| Mealy – Non-overlapping      | 5      | ❌       | 1 cycle after last bit        |
| Moore – Overlapping          | 5      | ✅       | *2 cycles* after last bit   |
| Moore – Non-overlapping      | 5      | ❌       | *2 cycles* after last bit   |
