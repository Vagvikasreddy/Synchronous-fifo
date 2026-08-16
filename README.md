# Synchronous FIFO in Verilog

A **Synchronous FIFO (First-In, First-Out)** designed using Verilog HDL. The project implements a memory-based FIFO that stores and retrieves data in the same order it was written. It includes control logic for read/write operations, status flags, reset functionality, and a testbench for simulation and verification.

## Features

* Parameterized data width and FIFO depth
* Synchronous read and write operations
* FIFO memory implementation using registers
* Write and read pointer management
* `full` flag to indicate when the FIFO cannot accept more data
* `empty` flag to indicate when the FIFO contains no data
* Reset functionality
* Protection against invalid write operations when FIFO is full
* Protection against invalid read operations when FIFO is empty
* Testbench for functional verification

## Project Files

| File           | Description                               |
| -------------- | ----------------------------------------- |
| `fifosync.v`   | Main synchronous FIFO module              |
| `fifosynctb.v` | Testbench for simulation and verification |

## Working Principle

The FIFO follows the **First-In, First-Out** principle. Data written first is always read first. A write operation stores input data at the location indicated by the write pointer, while a read operation retrieves data from the location indicated by the read pointer.

After each successful write, the write pointer advances. After each successful read, the read pointer advances. The FIFO uses these pointers along with control logic to determine whether the memory is **full or empty**.

The `full` flag prevents additional writes when the FIFO has reached its maximum capacity, while the `empty` flag prevents reads when there is no valid data available.

## Verification

The testbench performs reset, write, and read operations to verify the FIFO functionality. It checks the behavior of the FIFO under normal operation as well as full and empty conditions.

## Key Concepts

* RTL Design
* Verilog HDL
* Synchronous FIFO
* Memory Modeling
* Read/Write Pointers
* Full/Empty Detection
* Digital Design
* Testbench Verification

## Technologies

**Verilog HDL · RTL Design · Digital Electronics · FIFO Architecture · Simulation · Hardware Verification**

