# ------------------------First subtask------------------------------
defmodule FirstSubtask do
  def get_id_of_correct_game(game) do
    game_and_subsets = game |> String.split(":", trim: true)
    game_with_id = game_and_subsets |> Enum.at(0)
    subsets = game_and_subsets |> Enum.at(1)

    constraints = %{"red" => 12, "green" => 13, "blue" => 14}

    IO.puts("New Game")

    subsets
    |> String.split(";", trim: true)
    |> Stream.map(fn subset ->
      subset
      |> String.split(",", trim: true)
      |> Stream.map(fn entry ->
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
    |> Enum.to_list()
    |> Enum.all?()
    |> Stream.map(&IO.puts/1)
    |> Stream.run()
  end
end

File.stream!("dummy_input.txt")
|> Stream.map(&String.trim/1)
|> Stream.map(fn line -> FirstSubtask.get_id_of_correct_game(line) end)
# |> Stream.map(&IO.puts/1)
|> Stream.run()

# IO.puts("First solution: #{first_solution}")

# ------------------------Second subtask------------------------------
