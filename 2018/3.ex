defmodule Three do
  def parse_input do
    File.read!("3.input")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
    |> Enum.map(&find_squares/1)
    |> IO.inspect
  end

  defp parse_line(line) do
    [x, y, w, h] = Regex.scan(~r/\d+/, line)
                   |> Enum.drop(1)
                   |> List.flatten
                   |> Enum.map(&Integer.parse/1)
                   |> Enum.map(fn {i, _} -> i end)

    {[x, y], [w, h]}
  end

  def find_squares({[x, y], [w, h]}) do
    Enum.reduce(y..y+h-1, [], fn y_coord, acc ->
      acc ++ Enum.map(x..x+w-1, &[&1, y_coord])
    end)
  end
end
