# 1011 Sequence Detector (Mealy & Moore Machine)

This project implements a **1011 sequence detector** using both **Mealy** and **Moore** state machine models in **Verilog**. It detects the binary pattern `1011` in a serial input stream and provides an output signal when the sequence is recognized.

## Project Overview

The sequence detector is implemented in two styles:
- **Mealy Machine**: Output depends on the current state and input.
- **Moore Machine**: Output depends only on the current state.

This allows comparison of behavior, performance, and state diagram complexity between the two models.

## How to Run

1. **Tools Required**:  
   - Xilinx Vivado (or any Verilog simulation tool like ModelSim, GTKWave, etc.)

2. **Steps**:
   - Open your simulator and create a new project.
   - Add the Verilog files and respective testbenches.
   - Run the simulation and observe the output waveform.
   - Verify the output signal goes HIGH when `1011` sequence is detected.

## Test Input Sequence

Example input sequence used in testbenches: 1011

## Waveform Results

Simulation waveforms are available in the .png files named as:
- Mealy Overlapping 
- Mealy Non-overlapping
- Moore Overlapping 
- Moore Non-overlapping

## Concepts Covered

- Finite State Machine (FSM)
- Mealy and Moore Models
- Sequence Detection
- Verilog HDL
- Digital Design Simulation





