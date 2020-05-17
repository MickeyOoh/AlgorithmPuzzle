defmodule Cut do
  def cut(x, y, acc) when x == y do

    cut(y, x, acc)
  end
  def cut(x, y, acc) do
    
    cut()
  end
  
end