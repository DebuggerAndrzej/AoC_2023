# ------------------------First subtask------------------------------
defmodule FirstSubtask do
  def get_two_digit_number_from_string(str) do
    case String.length(str) do
      1 -> "#{str}#{str}"
      2 -> str
      n when n > 2 -> "#{String.first(str)}#{String.last(str)}"
      0 -> 0
    end
  end
end

first_solution =
  File.stream!("input.txt")
  |> Stream.map(&String.trim/1)
  |> Stream.map(fn line -> line |> String.replace(~r/[\D+]/, "") end)
  |> Stream.map(fn line -> FirstSubtask.get_two_digit_number_from_string(line) end)
  |> Stream.map(fn line ->
    if line != 0 do
      {num, _} = Integer.parse(line)
      num
    else
      0
    end
  end)
  |> Enum.sum()

IO.puts("First solution: #{first_solution}")

# ------------------------Second subtask------------------------------
defmodule SecondSubtask do
  def append_number_to_string_sequence(str) do
    numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    numbers
    |> Enum.with_index()
    |> Enum.reduce(str, fn {num, i}, result ->
      String.replace(result, num, "#{String.first(num)}#{to_string(i + 1)}#{String.last(num)}")
    end)
  end
end

second_solution =
  File.stream!("input.txt")
  |> Stream.map(&String.trim/1)
  |> Stream.map(fn line -> SecondSubtask.append_number_to_string_sequence(line) end)
  |> Stream.map(fn line -> line |> String.replace(~r/[\D+]/, "") end)
  |> Stream.map(fn line -> FistSubtask.get_two_digit_number_from_string(line) end)
  |> Stream.map(fn line ->
    if line != 0 do
      {num, _} = Integer.parse(line)
      num
    else
      0
    end
  end)
  |> Enum.sum()

IO.puts("Second solution: #{second_solution}")
