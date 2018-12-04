defmodule Two do
  def parse_input do
    File.read!("2.input")
    |> String.trim
    |> String.split("\n")
  end

  def find_checksum(list \\ parse_input()) do
    [a, b] = Enum.map(list, &match_values/1)
    |> Enum.reduce([0, 0], fn [a, b], [c, d] ->
      [a + c, b + d]
    end)
    a * b
  end

  def match_values(string) do
    counts = string
    |> String.graphemes
    |> Enum.group_by(&(&1))
    |> Map.values
    |> Enum.map(&length/1)
    [2, 3]
    |> Enum.map(fn n ->
      if Enum.any?(counts, &(&1 == n)), do: 1, else: 0
    end)
  end

end
