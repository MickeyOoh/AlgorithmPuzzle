defmodule Loop do
  use Bitwise

  @doc """
    山の手線環状線　29駅のスタンプ収集
  """
  
  @max_st 29

  def cal(stapos, endpos) do
    n = abs(endpos - stapos)

    (1 <<< (n - 1)) + ( 1 <<< (@max_st - n - 1)) - 1
  end
end