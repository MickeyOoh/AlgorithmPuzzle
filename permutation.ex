defmodule Permu do 
  def nPr(n, r) when n < r, do: 0
  def nPr(n, r) when r == 0 or n == 0, do: 1
  def nPr(n, r) do
    Enum.into((n - r + 1)..n, [])
    |> Enum.reduce(  1, fn r, acc -> acc * r end)

    # Enum.into((n - r + 1)..n, [])
    # |> calP(  1)
    # |> IO.inspect    
  end
  # def calP([], acc), do: acc
  # def calP([h | t], acc), do: calP(t, acc * h)

  def nCr(n, r) when n < r, do: IO.puts("Illegal numbers n=#{n}, r=#{r}")
  def nCr(n, r) when n == r, do: 1
  def nCr(n, r) do
    div(nPr(n, n - r), nPr(n - r,n - r))
  end
  # 漸化式
  # nCr = nCr-1 * (n - r + 1)/r,  nC0= 1
  # def nCr(n, 0), do: 1
  # def nCr(n,r), do: _nCr(n, r, k)

  # def _nCr(n, r, k) do
  #   nCr(n, r - 1) * (n - r + 1)/r

  # end
  def permutations([]), do: [[]]
  def permutations(list) do
     for elem <- list,
         rest <- permutations(list--[elem]) 
     do
       [elem|rest]
     end
  end

end