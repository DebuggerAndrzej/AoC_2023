# ------------------------First subtask------------------------------
defmodule FirstSubtask do
  def get_id_if_correct_game(game) do
    game_and_subsets = game |> String.split(":", trim: true)
    game_with_id = game_and_subsets |> Enum.at(0)
    subsets = game_and_subsets |> Enum.at(1)
    constraints = %{"red" => 12, "green" => 13, "blue" => 14}

    all_subsets_valid =
      subsets
      |> String.split(";", trim: true)
      |> Enum.map(fn subset ->
        subset
        |> String.split(",", trim: true)
        |> Enum.map(fn entry ->
          amount = String.split(entry, " ", trim: true) |> Enum.at(0)
          color = String.split(entry, " ", trim: true) |> Enum.at(1)
          {amount, _} = Integer.parse(amount)

          if constraints[color] >= amount do
            true
          else
            false
          end
        end)
        |> Enum.all?()
      end)
      |> Enum.all?()

    if all_subsets_valid == true do
      game_id = game_with_id |> String.split(" ") |> Enum.at(1)
      {game_id, _} = Integer.parse(game_id)
      game_id
    else
      0
    end
  end
end

first_solution =
  File.stream!("input.txt")
  |> Stream.map(&String.trim/1)
  |> Stream.map(fn game -> FirstSubtask.get_id_if_correct_game(game) end)
  |> Enum.sum()

IO.puts(first_solution)

# ------------------------Second subtask------------------------------
defmodule SecondSubtask do
  def get_power_of_cubes(game) do
    game_and_subsets = game |> String.split(":", trim: true)
    subsets = game_and_subsets |> Enum.at(1)
    min_red = 0
    min_blue = 0
    min_green = 0

    subsets
    |> String.split(";", trim: true)
    |> Enum.map(fn subset ->
      subset
      |> String.split(",", trim: true)
      |> Enum.map(fn entry ->
        amount = String.split(entry, " ", trim: true) |> Enum.at(0)
        color = String.split(entry, " ", trim: true) |> Enum.at(1)
        {amount, _} = Integer.parse(amount)

        case color do
          "blue" ->
            if amount > min_blue do
              min_blue = amount
              IO.puts(min_blue)
            end

          "red" ->
            if amount > min_red do
              min_red = amount
            end

          "green" ->
            if amount > min_green do
              min_green = amount
            end
        end
      end)
    end)

    0
  end
end

first_solution =
  File.stream!("dummy_input.txt")
  |> Stream.map(&String.trim/1)
  |> Stream.map(fn game -> SecondSubtask.get_power_of_cubes(game) end)
  |> Enum.sum()

IO.puts(first_solution)
