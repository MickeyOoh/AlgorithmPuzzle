defmodule Math do 

  # def nPr(n, r), do: nPr(n, r, 1)

  # def nPr(n, 1, ans), do: ans * n 
  # def nPr(n, r, ans) do
  #   n * nPr(n - 1, r - 1, ans)  
  # end
  def nPr(n, r) do
    l = Enum.into(r..n, [])
    Enum.reduce(l, 1, fn r, acc -> acc * r end)
  end

  def nCr(n, r) do
    div(nPr(n, r), nPr(n - r,1))
  end
  # 漸化式
  # nCr = nCr-1 * (n - r + 1)/r,  nC0= 1
  def nCr(n, 0), do: 1
  def nCr(n,r), do: _nCr(n, r, k)

  def _nCr(n, r, k) do
    nCr(n, r - 1) * (n - r + 1)/r

  end
end