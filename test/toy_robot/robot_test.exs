defmodule ToyRobot.RobotTest do
  use ExUnit.Case
  doctest ToyRobot.Robot

  alias ToyRobot.Robot

  describe "Quando o robô estiver direcionado para a direita (:east)" do
    setup do
      {:ok, %{robot: %Robot{x: 0, facing: :east}}}
    end

    test "mova uma posição no tabuleiro", %{robot: robot} do
      new_robot = robot |> Robot.move()
      assert new_robot.x == 1
    end

    # test "mova três posições no tabuleiro", %{robot: robot} do
    #   new_robot = robot |> Robot.move() |> Robot.move() |> Robot.move()
    #   assert new_robot.x == 3
    # end
  end
end
