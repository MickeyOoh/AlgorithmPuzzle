defmodule Permute do
  
  @doc """
  右端が1を除く9P2の順列を考える
  (構築中の順列, 使用可能な文字)
  ( , 123) -- (1, 23) -- (12, 3)  -- (012, )
                         (13, 2)  -- (132, )
              (2, 13) -- (21, 3)
                         (23, 1)
              (3, 12) -- (31, 2)
                         (32, 1)
  """

  #@len 9

  def run(len \\ 9) do
    #IO.puts("start")
    #lists = permuof(len)
    #IO.puts("end of permuof()")
    #lists
    permuof(len)
    |> makegenlist(  [])
    |> makegenlist(  [])
    |> makegenlist(  [])
    |> makegenlist(  [])
    |> makegenlist(  [])
    |> length()
    |> IO.inspect(label: "case:")
  end

  def permuof(len) do
    permutations( Enum.into(2..len,[]) )
    |> Enum.map( &([1 | &1]))
  end

  def makegenlist([], genlist), do: genlist
  def makegenlist([h | t], genlist) do
    addlist = reverselist([1,2,3,4,5,6,7,8], h, [])
    genlist = genlist ++ addlist
    makegenlist(t, genlist)
  end

  def reverselist([], _list, acc), do: acc
  def reverselist([h | t], list, acc) do
      if Enum.at(list, h) == h + 1 do
        {pre, tail} = Enum.split(list, h + 1) 
        add = Enum.reverse(pre, tail)
        reverselist(t, list, [add | acc])
      else
        reverselist(t, list, acc)
      end
  end

  def permutations([]), do: [[]]
  def permutations(list) do
     for elem <- list,
         rest <- permutations(list--[elem]) 
     do
       [elem|rest]
     end
  end

end

Permute.run