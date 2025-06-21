defmodule ToyRobot.CommandInterpreter do

  def interpret(commands) do
    commands |> Enum.map(&do_interpret/1)
  end

  def do_interpret("PLACE " <> rest) do
    [x, y, facing] = rest |> String.split(",")

    {
      :place,
      %{
        x: String.to_integer(x),
        y: String.to_integer(y),
        facing: facing |> String.downcase() |> String.to_atom()
      }
    }
  end

  def do_interpret("MOVE") do
    :move
  end

  def do_interpret("REPORT") do
    :report
  end

  def do_interpret("LEFT") do
    :left
  end

  def do_interpret("RIGHT") do
    :right
  end

  def do_interpret(command) do
    {:invalid, command}
  end

end
