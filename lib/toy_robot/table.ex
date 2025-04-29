defmodule ToyRobot.Table do
  alias ToyRobot.Table
  defstruct [x_max: 4, y_max: 4]

  @doc """
  Determina se uma posição estaria dentro dos limites do tabuleiro

  ## Exmeplo

    iex> alias ToyRobot.Table
    ToyRobot.Table
    iex> table = %Table{ x_max: 4, y_max: 4 }
    %Table{ x_max: 4, y_max: 4 }
    iex> table |> Table.valid_position?(%{ x: 4, y: 4 })
    true
    iex> table |> Table.valid_position?(%{ x: 0, y: 0 })
    true
    iex> table |> Table.valid_position?(%{ x: 6, y: 4 })
    false
    iex> table |> Table.valid_position?(%{ x: 4, y: 6 })
    false
    iex> table |> Table.valid_position?(%{ x: -2, y: 2 })
    false
    iex> table |> Table.valid_position?(%{ x: 2, y: -2 })
    false
  """
  def valid_position?(%Table{x_max: x_max, y_max: y_max}, %{x: x, y: y}) do
    x >= 0 && y >= 0 && x <= x_max && y <= y_max
  end

end
