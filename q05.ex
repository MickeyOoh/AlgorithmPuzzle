defmodule Pascal do

  def run(sel) do
    map = make_array(sel, %{0 => [1]})
    cal_coin(map[sel], %{})
    |> IO.inspect
    |> Map.values( )
    |> Enum.sum( )
  end
  def make_array(sel, acc) when map_size(acc) > sel, do: acc
  def make_array(sel, acc) do
    id = map_size(acc) - 1
    acc2 = cal_new(acc[id], [])
    acc = Map.put_new(acc, id + 1, acc2)
    make_array(sel, acc)
  end

  defp cal_new(list, []), do: cal_new(list, [1])
  defp cal_new([_h1 | []], acc2) do
    acc2 ++ [1]     # 
  end
  defp cal_new([h1 | [h2 | t]], acc2) do
    acc2 = acc2 ++ [h1 + h2]  # a(n) + a(n + 1)
    cal_new([h2 | t], acc2)
  end

  @coins [10000, 5000, 2000, 1000, 500, 100, 50, 10, 5, 1]
  def cal_coin([], acc), do: acc
  def cal_coin([money | t], acc) do

    acc = count(money, @coins, acc)
    cal_coin(t, acc)
  end

  def count(0, [], acc), do: acc
  def count(m, [coin | t], acc) do
    cnt = div(m, coin)
    rem = Integer.mod(m, coin)
    acc = Map.update(acc, coin, cnt, &(&1 + cnt))
    count(rem, t, acc)
  end
end