defmodule One do
  def read_input do
    File.read!("1.input")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(fn {n, _} -> n end)
  end

  def parse, do: read_input() |> do_parse()

  def do_parse(input_list) do
    input_list |> Enum.sum
  end

  def find_repeats(input_list) do
    input_list
    |> Stream.cycle
    |> Enum.reduce_while({[0], 0}, fn n, {seen, sum} ->
      new_sum = sum + n
      if Enum.find(seen, fn x -> x == new_sum end) do
        {:halt, seen}
      else
        {:cont, {[new_sum|seen], new_sum}}
      end
    end)
  end
end
