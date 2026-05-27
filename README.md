# RISC-V Console Calculator

A simple menu-driven console calculator developed using **RISC-V Assembly Language** in the **RARS simulator**.  
This project demonstrates arithmetic operations, user interaction, error handling, and register management using low-level programming concepts.

---

## Features

- Addition
- Subtraction
- Multiplication
- Division
- Modulus Operation
- Store Previous Result
- Reuse Previous Result
- Invalid Input Handling
- Division by Zero Protection
- Menu-Driven Console Interface

---

## Technologies Used

- RISC-V Assembly Language
- RARS Simulator

---

## Project Structure

```bash
├── calculator.asm      # Main RISC-V assembly source code
├── COAL prjct.pdf      # Project documentation
└── README.md
Functional Requirements

The calculator system:

Displays a menu with operations
Accepts two integer inputs
Performs arithmetic calculations
Stores previous calculation result
Allows reuse of previous result
Handles invalid menu choices
Prevents division by zero
Allows user to exit the program
Menu Interface
********************************
      RISC-V CALCULATOR
********************************

[1] Add (+)
[2] Subtract (-)
[3] Multiply (*)
[4] Divide (/)
[5] Modulus (%)
[6] Reuse Previous Result
[7] Exit
Sample Run
Enter choice: 1
Enter first number: 10
Enter second number: 5
Result: 15
Enter choice: 4
Enter first number: 10
Enter second number: 0
Error: Division by zero!
Registers Used
Register	Purpose
s0	Stores previous result
s1	Result availability flag
t-registers	Temporary calculations
Error Handling

The program handles:

Invalid menu choices
Division by zero
Missing previous result
How to Run
Install the RARS Simulator
Open calculator.asm
Assemble and Run the program
Use the console menu to perform operations
Learning Outcomes

This project demonstrates:

RISC-V instruction usage
Assembly-level arithmetic operations
Branching and loops
Register management
Console input/output
Error handling in assembly language
