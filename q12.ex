defmodule FractionPi do
  @moduledoc """
  p/q = 3.14....となる分数は
  3.14 * q < p < 3.15 * q
  q を一つずつ増やすし、3.14 * q != 3.15 * qとなる値を見つける
  """
  @pi  314159265358
  @pow 100_000_000_000      ## 小数点11以下
  ##@pi  3145
  ##@pow 1000     ## 小数点6以下

  def run(_keta \\ 11) do
    fraction(1)

  end
  def fraction(q) do
    ##if q * @pi / @pow != q * (@pi + 1)/@pow do
    if div(q * @pi,@pow) != div(q * (@pi + 1), @pow) do
      if rem(q * (@pi + 1), @pow) > 0 do
        IO.puts "q:#{q}, p:#{trunc(div(q * (@pi + 1),@pow))}"
      else
        IO.puts "rem 0 q:#{q}"
      end
    else
      if( q < @pow) do 
        fraction(q + 1)
      else
        IO.puts "Error"
      end
    end
  end

end