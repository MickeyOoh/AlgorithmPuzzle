defmodule SevenSeg do
  #         0  1  2  3  4  5  6  7  8  9
  #light = [6, 2, 5, 5, 4, 5, 6, 3, 7, 6]
  #         __
  #        |  |
  #         --
  #        |  |
  #         --
  def check(n) do
    segs = %{0 => 6, 1 => 2, 2 => 5, 3 => 5, 4 => 4, 
             5 => 5, 6 => 6, 7 => 3, 8 => 7, 9 => 6}
    ord_10 = div(n, 10)
    ord_1  = Integer.mod(n, 10)
    segs[ord_1] + segs[ord_10]
  end
  def count_segs(sel_num) do
    hours = Enum.into(0..23,[])
    mins  = Enum.into(0..59,[])
    secs  = Enum.into(0..59,[])
    acc = checksegs(hours, mins, secs, %{})
    #acc[sel_num]
  end

  defp checksegs([], _, _, acc), do: acc

  ## min 59 -> 0 then hours = hours + 1
  defp checksegs([h | t1], [], [s | t3], acc) do
    [m | t2] = Enum.into(0..59,[])
    num_line = check(h) + check(m) + check(s)
    acc = Map.update(acc, num_line, 1, &(&1 + 1))
    checksegs( t1, t2, t3,  acc)    
  end
  ###sec 59-> 0 then min = min + 1
  defp checksegs(hours = [h | _t1], [m | t2], [], acc) do
    secs = Enum.into(0..59,[])
    [s | t3] = secs
    num_line = check(h) + check(m) + check(s)
    acc = Map.update(acc, num_line, 1, &(&1 + 1))
    checksegs(hours, t2, t3,  acc)       
  end
  ## sec loop 0->59
  defp checksegs( hours=[h | _t1], mins = [m | _t2], [s | t3], acc) do
    num_line = check(h) + check(m) + check(s)
    acc = Map.update(acc, num_line, 1, &(&1 + 1))
    checksegs( hours, mins, t3,  acc)
  end
end