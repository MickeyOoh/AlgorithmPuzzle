defmodule Arrange do

  def nPr(n, r) when n < r, do: 0
  def nPr(n, r) when r == 0 or n == 0, do: 1
  def nPr(n, r) do
    Enum.into((n - r + 1)..n, [])
    |> Enum.reduce(  1, fn r, acc -> acc * r end)
  end

  def run(n) do
    ans = move(n, 1, 0)
    ansstr = Integer.to_string(ans)

    IO.puts("ans=#{ansstr}")
  end
  def move(num, times, acc) when times >= num, do: acc
  def move(num, times, acc) do
    acc = acc + times * (num - times) * nPr(num, times - 1)
    move(num, times + 1, acc) 
  end
end