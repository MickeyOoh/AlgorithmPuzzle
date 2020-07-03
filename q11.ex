defmodule Vote do
  @docmodule """
  開催地の決定に使われるのが「繰り返し最下位消去ルール」です。トップが過半数に達すると一回の投票
  で決定しますが、トップが過半数を取れなかった場合、最下位を除外してもう一度投票を行います。
  過半数を得るまでこの方法を繰り返します。
  
  """

  def run(n \\ 7) do
    vote(n, 0)

  end
  def vote(n, _cases) when n <= 2, do: 1
  def vote(n, cases) do
    
  end
end