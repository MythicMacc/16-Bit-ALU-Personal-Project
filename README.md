# 16-Bit-ALU-Personal-Project
16-Bit Arithmetic Logic Unit (ALU) built from the ground up, first designed and verified at the schematic level in CircuitVerse, then implemented in Verilog and simulated in Quartus/ModelSim. 

I am very much still learning digital logic and Verilog so this is my first solo project. I did a lot of gate level modeling with the coding for that reason. All of this code was done by me, outside of the testbench.

Features
  - 16-bit carry-lookahead adder/subtractor (4x chained 4-bit CLA blocks)
  - Bitwise logic operations: AND, OR, XOR, NOT, NAND, NOR
  - Shift operations: logical left, logical right, and arithmetic right
  - Increment A, Decrement A, Pass A, and Pass B
  - Set Less Than (returns 1 if A is less than B)
  - Status flags: Zero,Carry(Cout),Overflow,Sign-bit (all 1-bit)
  - 4-bit opcode select (16 operations total)

<img width="571" height="496" alt="{E41AEB23-23EE-4469-8FDC-F58A6AF109DB}" src="https://github.com/user-attachments/assets/926799ef-a344-4ade-8b0b-9106103b90ac" />

