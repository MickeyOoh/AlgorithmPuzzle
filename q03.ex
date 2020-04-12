defmodule Roman do
  #defstruct [:size, :cases]

  # @order_1 %{0 => "", 1 => "I", 2 => "II", 3 => "III", 4 => "IV",
  #           5 => "V",6 => "VI", 7=> "VII", 8 => "VIII", 9 => "IX"}
  # @order_10 %{0 => "", 1 => "X", 2 => "XX", 3 => "XXX", 4 => "XL",
  #           5 => "L",6 => "LX", 7=> "LXX", 8 => "LXXX", 9 => "XC"}
  # @order_100 %{0 => "", 1 => "C", 2 => "CC", 3 => "CCC", 4 => "CD",
  #           5 => "D",6 => "DC", 7=> "DCC", 8 => "DCCC", 9 => "CM"}
  # @order_1000 %{0 => "", 1 => "M", 2 => "MM", 3 => "MMM"}
  # @order_list [@order_1, @order_10, @order_100, @order_1000]

  # def search(len) do
  #   n_list = Enum.into(1..3999, [])
  #   Enum.count(n_list, fn n -> String.length(roman(n)) == len end)
  # end
  # def roman(n) do
  #   Integer.digits(n)
  #   |> Enum.reverse( )
  #   |> Enum.zip(  @order_list)
  #   |> Enum.reduce(  "", fn {n, list}, acc -> list[n] <> acc end)
  # end
  @doc """
  ローマ数字の記号を12個並べた時、ローマ字として認識できる数が何通りあるかを求める
  たとえば、1個の記号で表現できるのは、I, V, X, L, C, D, Mの7通り、15個の記号で
  表現できるのは「MMMDCCCLXXXVIII」(3,888)の1通りとなる

  search(12)  -- 12個の記号

  iex> search(12)
  93
  
  """

  def search(len), do: _search(len, 1, 0)

  def _search(_, n, ans) when n > 3999, do: ans

  def _search(len, n, ans) do
    str = roman(n)
    strlen = String.length(str)
    _search(len, n + 1, ans + check(len, strlen))
  end
  def check(len, strlen) when len == strlen, do: 1
  def check(_, _), do: 0

  @romanchar [["I", "V", "X"], ["X", "L", "C"], ["C", "D", "M"], ["M", "", ""]]
  @doc """
  roman() 数字をローマ数字に変換する

  """
  def roman(n) do
    Integer.digits(n)
    |> Enum.reverse( )
    |> Enum.zip(  @romanchar)
    |> Enum.reduce(  "", fn {n, [i, v, x]}, acc -> conv(n, i, v, x) <> acc end)
  end
  @doc """
  conv() 例　i- "I", v-"V", x-"X"　
       1  2  3  4  5  6   7    8  9
  　　　I II III IV V  VI VII VIII IX
  """
  def conv(digit, i, v, x) do
    cond do
      digit == 9 -> i <> x 
      digit == 4 -> i <> v 
      digit >= 5 -> v <> String.duplicate(i, Integer.mod(digit, 5))
      digit  < 4 -> String.duplicate(i, Integer.mod(digit, 5))
    end
  end
end