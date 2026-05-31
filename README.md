# Frequency Divider — Verilog RTL Design

A synchronous **divide-by-16 frequency divider** implemented in Verilog using a chain of four JK flip-flops. Each flip-flop divides its input clock by 2, so four stages in series produce an output frequency that is 1/16th of the input.

---

## Project Structure

```
├── J-K_Flip-Flop.v      # JK flip-flop primitive module
├── Freequency_divider.v  # Top-level frequency divider (4-stage chain)
└── test_bench.v          # Simulation testbench
```

---

## Module Descriptions

### `Jk_ff` — JK Flip-Flop (`J-K_Flip-Flop.v`)

The fundamental building block. A positive-edge-triggered JK flip-flop with asynchronous active-high reset.

| Port | Direction | Description              |
|------|-----------|--------------------------|
| `clk`| Input     | Clock signal             |
| `rst`| Input     | Asynchronous reset (active high) |
| `j`  | Input     | J input                  |
| `k`  | Input     | K input                  |
| `y`  | Output    | Q output                 |

**Truth Table:**

| J | K | Action         |
|---|---|----------------|
| 0 | 0 | Hold (no change) |
| 0 | 1 | Reset (y = 0)  |
| 1 | 0 | Set (y = 1)    |
| 1 | 1 | Toggle (y = ~y)|

---

### `fd` — Frequency Divider (`Freequency_divider.v`)

Top-level module. Instantiates four `Jk_ff` modules in a ripple counter configuration — all with `J=1` and `K=1` (toggle mode). Each stage's output clocks the next stage.

| Port | Direction | Description                        |
|------|-----------|------------------------------------|
| `clk`| Input     | Input clock                        |
| `rst`| Input     | Asynchronous reset (active high)   |
| `y`  | Output    | Divided clock (f_out = f_in / 16)  |

**Block Diagram:**
```
clk ──► [JK1] ──w1──► [JK2] ──w2──► [JK3] ──w3──► [JK4] ──► y
         ÷2             ÷2             ÷2             ÷2
```

---

### `test_bench` — Testbench (`test_bench.v`)

Simulates the frequency divider with a 20 ns clock period (50 MHz input). Applies a reset pulse and monitors the output.

- Clock period: `20 ns` (toggle every `10 ns`)
- Reset: asserted at `t = 20 ns`, de-asserted at `t = 50 ns`
- `$monitor` logs changes on `clk`, `rst`, and `y`

---

## Simulation

This project was developed in **Vivado**. To simulate:

1. Add all three `.v` files to your project.
2. Set `test_bench` as the top-level simulation module.
3. Run behavioral simulation.
4. Observe the output `y` toggling at 1/16th the input clock frequency.

**Expected output frequency:**
```
f_out = f_in / 16
<img width="2156" height="450" alt="image" src="https://github.com/user-attachments/assets/f7ab495e-9203-41dd-ad16-a5db810c44b6" />

```
For a 50 MHz input clock → output is **3.125 MHz**.

---

## Tools

- **Language:** Verilog (IEEE 1364)
- **Timescale:** `1ns / 1ps`
- **EDA Tool:** Xilinx Vivado
- **Simulation:** Vivado Behavioral Simulation / ModelSim compatible
