defmodule Narcissist do
  @usage """
  abc = a^3 + b^3 + c^3
  ナルシシスト数が有限個しか存在しないことは、簡単に証明できる。
  n 桁の自然数のうち、各桁の n 乗和が最大になるのは、10^(n − 1) に対する n × 9^n である。
  一方、n 桁の自然数のうち、最小のものは 10^(n−1) である。十分大きな n に対して
  n × 9^n < 10^(n−1) となる（実際、n > 60 でこの不等式は成り立つ）が、そのような n に対しては、
  n 桁のナルシシスト数は存在しない。
  ナルシシスト数は(0を含めないならば)全部で88個存在し、その最大のものは39桁の数
    115132219018763992565095597973971522401
  である。
  """
  def run(base) do
    #IO.puts @usage
    digits = search(base, 1)
    IO.puts("#{digits} 桁")
    #max = trunc(:math.pow(base, digits))
    check(base, base, [])
    #check(1, [])
  end

  def search(base, digits) do
    first_item  = digits * :math.pow((base - 1), digits)
    second_item = :math.pow(base, digits - 1)
    if( first_item < second_item) do
      digits
    else 
      search(base, digits + 1)
    end
  end

  def check(_n, _base, ans) when length(ans) >= 8, do: ans
  def check( n, _base, ans) when n >= 1_000_000, do: ans
  def check( n, base, ans) do
    nlst = Integer.digits(n, base)
 
    len = length(nlst)
    
    num = Enum.reduce(nlst, 0, 
            fn x, acc ->
               trunc(:math.pow(x, len)) + acc
            end
          )
    addl = if n == num do
             strnum = Enum.join(nlst)
             [strnum]
           else
             []
           end

    check(n + 1, base, ans ++ addl)
  end

end