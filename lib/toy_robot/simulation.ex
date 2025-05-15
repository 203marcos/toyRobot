defmodule ToyRobot.Simulation do
  alias ToyRobot.{Robot, Table, Simulation}
  defstruct [:robot, :table]

  @doc """
  Simula o posicionamento inicial do roô no tabuleiro

  ## Exemplo

  ### Quando o robô é posicionado em uma posição válida
    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> Simulation.place(table, %{x: 0, y: 0, facing: :north})
    {
      :ok,
      %Simulation{
        table: table,
        robot: %Robot{x: 0, y: 0, facing: :north}
      }
    }

  ### Quando o robô é posicionado em uma posição inválida
    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> Simulation.place(table, %{x: 6, y: 0, facing: :north})
    {:error, :invalid_placement}
  """
  def place(table, placement) do
    if table |> Table.valid_position?(placement) do
      {
        :ok,
        %Simulation{
          table: table,
          robot: struct(Robot, placement)
        }
      }
    else
      {:error, :invalid_placement}
    end
  end

  @doc """
  Movimenta o robô um espaço da direção que ele está apontando, a menos que essa posição esteja além dos limites do tabuleiro

  ## Exemplo

  ### Um movimento válido
    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> simulation = %Simulation {
    ...>   table: table,
    ...>   robot: %Robot{x: 0, y: 0, facing: :east}
    ...> }
    iex> simulation |> Simulation.move()
    {
      :ok,
      %Simulation{
        table: table,
        robot: %Robot{ x: 1, y: 0, facing: :east}
      }
    }

  ### Um movimento inválido
    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> simulation = %Simulation {
    ...>   table: table,
    ...>   robot: %Robot{x: 4, y: 0, facing: :east}
    ...> }
    iex> simulation |> Simulation.move()
    {:error, :at_table_boundary}

  """
  def move(%Simulation{robot: robot, table: table} = simulation) do
    with moved_robot <- robot |> Robot.move(),
      true <- table |> Table.valid_position?(moved_robot) do
        {
          :ok,
          %{simulation | robot: robot |> Robot.move}
        }
      else
        false -> {:error, :at_table_boundary}
      end
  end

  def report(%Simulation{robot: %Robot{x: x, y: y, facing: facing}}) do
    %{x: x, y: y, facing: facing}
  end

end
