defmodule ToyRobot.Robot do

  alias ToyRobot.Robot
  defstruct [ x: 0, y: 0, facing: :north ]


  @doc """
    Função responsável pela movimentção do robô

    ## Examples

    iex> alias ToyRobot.Robot
    iex> Robot.move(%Robot{x: 1, y: 1, facing: :east})
    %Robot{x: 2, y: 1, facing: :east}

    iex> alias ToyRobot.Robot
    iex> Robot.move(%Robot{x: 1, y: 1, facing: :west})
    %Robot{x: 0, y: 1, facing: :west}

    iex> alias ToyRobot.Robot
    iex> Robot.move(%Robot{x: 1, y: 1, facing: :north})
    %Robot{x: 1, y: 2, facing: :north}

    iex> alias ToyRobot.Robot
    iex> Robot.move(%Robot{x: 1, y: 1, facing: :south})
    %Robot{x: 1, y: 0, facing: :south}


  """


  @doc """
    Função responsável por girar o robô 90 graus para a esquerda.

    ## Examples

    iex> alias ToyRobot.Robot
    iex> Robot.turn_left(%Robot{facing: :north, x: 0, y: 0})
    %Robot{facing: :west, x: 0, y: 0}

    iex> alias ToyRobot.Robot
    iex> Robot.turn_left(%Robot{facing: :west, x: 0, y: 0})
    %Robot{facing: :south, x: 0, y: 0}

    iex> alias ToyRobot.Robot
    iex> Robot.turn_left(%Robot{facing: :south, x: 0, y: 0})
    %Robot{facing: :east, x: 0, y: 0}

    iex> alias ToyRobot.Robot
    iex> Robot.turn_left(%Robot{facing: :east, x: 0, y: 0})
    %Robot{facing: :north, x: 0, y: 0}
"""


@doc """
  Função responsável por girar o robô 90 graus para a direita.

    ## Examples

    iex> alias ToyRobot.Robot
    iex> Robot.turn_right(%Robot{facing: :north, x: 0, y: 0})
    %Robot{facing: :east, x: 0, y: 0}

    iex> alias ToyRobot.Robot
    iex> Robot.turn_right(%Robot{facing: :east, x: 0, y: 0})
    %Robot{facing: :south, x: 0, y: 0}

    iex> alias ToyRobot.Robot
    iex> Robot.turn_right(%Robot{facing: :south, x: 0, y: 0})
    %Robot{facing: :west, x: 0, y: 0}

    iex> alias ToyRobot.Robot
    iex> Robot.turn_right(%Robot{facing: :west, x: 0, y: 0})
    %Robot{facing: :north, x: 0, y: 0}
"""

  def move(%Robot{facing: facing} = robot) do
    case facing do
      :east -> move_right(robot)
      :west -> move_left(robot)
      :north -> move_top(robot)
      :south -> move_bottom(robot)
    end
  end

  defp move_right(%Robot{} = robot) do
    %Robot{ robot | x: robot.x + 1 }
  end

  defp move_left(%Robot{} = robot) do
    %Robot{ robot | x: robot.x - 1  }
  end

  # defp move_top
  defp move_top(%Robot{} = robot) do
    %Robot{ robot | y: robot.y + 1 }
  end

  # defp move_bottom
  defp move_bottom(%Robot{} = robot) do
    %Robot{ robot | y: robot.y - 1 }
  end

  # def turn_left
  def turn_left(%Robot{facing: facing} = robot) do
    new_facing = case facing do
      :north -> :west
      :west -> :south
      :south -> :east
      :east -> :north
    end

    %Robot{robot | facing: new_facing}
  end

  # def turn_right
  def turn_right(%Robot{facing: facing} = robot) do
    new_facing = case facing do
      :north -> :east
      :east -> :south
      :south -> :west
      :west -> :north
    end

    %Robot{robot | facing: new_facing}
  end

end
