defmodule ToyRobot.CommandRunner do
  alias ToyRobot.{Simulation, Table}

  def run([{:place, placement} | rest]) do
    table = %Table{x_max: 4, y_max: 4}

    case Simulation.place(table, placement) do
      {:ok, simulation } -> run(rest, simulation)
      {:error, :invalid_placement} -> run(rest)
    end
  end

  def run([_command | rest]) do
    run(rest)
  end

  def run([]) do
    nil
  end

  def run([{:invalid, _commnad} | rest], simulation) do
    run(rest, simulation)
  end

  def run([:move | rest], simulation) do
    new_simulation =
      simulation
      |> Simulation.move()
      |> case do
        {:ok, new_sim_state} -> new_sim_state
        {:error, :at_table_boundary} -> simulation
      end

    run(rest, new_simulation)
  end

  def run([:report | rest], simulation) do
    %{x: x, y: y, facing: facing} = simulation |> Simulation.report()

    facing_pt = case facing do
      :north -> "norte"
      :east -> "leste"
      :west -> "oeste"
      :south -> "sul"
    end

    facing = facing |> to_string() |> String.upcase()

    IO.puts("O robô está atualmente em (#{x}, #{y}) e está voltado para o #{facing_pt} (#{facing})")

    run(rest, simulation)
  end

  def run([], simulation) do
    simulation
  end

  def run([:right | rest], simulation) do
    new_simulation = %{simulation | robot: simulation.robot |> ToyRobot.Robot.turn_right()}
    run(rest, new_simulation)
  end

  def run([:left | rest], simulation) do
    new_simulation = %{simulation | robot: simulation.robot |> ToyRobot.Robot.turn_left()}
    run(rest, new_simulation)
  end
end
