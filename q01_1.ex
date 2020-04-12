defmodule Game do
  @doc """
  グー、チョキ、パーで多いものが勝ちのパターン数
  """
  def play(n) do
      check(n, [0, 0, n], win([0,0,n]))
  end
  
  def check(_n, [_x, 0, 0], ans), do: ans

  def check(n, [x, _y, 0], ans) do
    x = x + 1
    y = 0
    z = n - x - y
    check(n, [x, y, z], ans + win([x,y,z]) )
  end
  def check(n, [x, y, _z], ans) do
    y = y + 1
    z = n - x - y
    check(n, [x, y, z], ans + win([x, y, z]))
  end

  def win(list) do
    cnt = Enum.count(list, &(&1 == Enum.max(list)))
    if cnt == 1, do: 1, else: 0 

  end
end