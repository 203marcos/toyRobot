# Toy Robot Simulation

This project is part of the **T300 - Functional Programming** course, taught by **Prof. Bruno Lopes**. It implements a simulation of a toy robot moving on a square tabletop, following specific commands. This problem is also a common exercise in technical interviews, as it tests problem-solving skills, modular design, and the ability to work with constraints.

## Problem Description

The application simulates a toy robot moving on a **5x5 tabletop**. The robot can move freely on the surface but cannot fall off the table. Any movement that would cause the robot to fall is ignored, but subsequent valid commands are still executed.

The application reads a file containing commands and executes them to simulate the robot's behavior. The valid commands are:

-   **`PLACE X,Y,F`**: Places the robot on the table at position `(X, Y)` facing `NORTH`, `SOUTH`, `EAST`, or `WEST`. The origin `(0,0)` is the southwest corner of the table. No other commands are executed until a valid `PLACE` command is issued.
-   **`MOVE`**: Moves the robot one unit forward in the direction it is currently facing.
-   **`LEFT`**: Rotates the robot 90 degrees to the left without changing its position.
-   **`RIGHT`**: Rotates the robot 90 degrees to the right without changing its position.
-   **`REPORT`**: Outputs the robot's current position and direction.

### Example

**Input:**

```
PLACE 0,0,NORTH
MOVE
RIGHT
MOVE
LEFT
MOVE
REPORT
```

**Output:**

```
The robot is currently at (1, 2) and facing NORTH.
```

## Project Structure

The project is organized into the following directories and files:

```
.
├── lib/
│   └── toy_robot/
│       ├── robot.ex                # Defines the Robot module and its actions (move, turn_left, turn_right).
│       ├── command_interpreter.ex  # (To be implemented) Parses commands from the input file.
│       ├── command_runner.ex       # (To be implemented) Executes the simulation based on parsed commands.
│       ├── simulation.ex           # (To be implemented) Manages the simulation logic.
│       └── table.ex                # (To be implemented) Defines the table's structure and boundaries.
├── test/
│   └── toy_robot/
│       ├── robot_test.exs                # Unit tests for the Robot module.
│       ├── command_interpreter_test.exs  # (To be implemented) Tests for the command interpreter.
│       ├── command_runner_test.exs       # (To be implemented) Tests for the command runner.
│       ├── simulation_test.exs           # (To be implemented) Tests for the simulation.
│       └── table_test.exs                # (To be implemented) Tests for the table.
├── commands.txt                # Example input file with commands for the robot.
├── mix.exs                     # Elixir project configuration file.
└── README.md                   # Project documentation.
```

## How to Test

### Prerequisites

Ensure **Elixir** is installed on your system.

### Running the Tests

1. Navigate to the project directory:

```bash
cd /home/robot/toy_robot
```

2. Run the tests using the following command:

```bash
mix test
```

### Testing the Robot Module

The `Robot` module defines the robot's behavior, including movement and rotation. You can test it manually in the Elixir interactive shell (`iex`):

1. Start the interactive shell:

```bash
iex -S mix
```

2. Run the following commands to test the robot:

```elixir
alias ToyRobot.Robot

# Test movement
robot = %Robot{x: 1, y: 1, facing: :north}
Robot.move(robot)

# Test turning left
Robot.turn_left(robot)

# Test turning right
Robot.turn_right(robot)
```

## Current Status

### Implemented

-   **`robot.ex`**:
    -   `move/1`: Moves the robot in the direction it is facing.
    -   `turn_left/1`: Rotates the robot 90 degrees to the left.
    -   `turn_right/1`: Rotates the robot 90 degrees to the right.
-   Unit tests for the `Robot` module.

### To Be Implemented

-   **`command_interpreter.ex`**: Parses commands from the input file.
-   **`command_runner.ex`**: Executes the simulation based on parsed commands.
-   **`simulation.ex`**: Manages the simulation logic.
-   **`table.ex`**: Defines the table's structure and boundaries.
-   Unit tests for the above modules.

## Additional Notes

This project is a great exercise for learning **functional programming concepts** and **modular design**. It is also commonly used in technical interviews to evaluate problem-solving skills and the ability to work with constraints.

For the full problem description and requirements, refer to the exercise document at: [Toy Robot Problem Description](https://docs.google.com/document/d/1Kd0S_0wJscst5XEI_joAO7vYigKWfjZvR1DARE1u-Ao/edit?usp=sharing)
