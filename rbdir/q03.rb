N = 12

def conv(n, i, v, x)
  result = ''
  if n == 9
    result += i + x
  elsif n == 4
    result += i + v
  else
    result += v * (n/5)
    n = n % 5
    result += i * n
  end
  result
end

def roman(n)
  m, n = n.divmod(1000)
  c, n = n.divmod(100)
  x, n = n.divmod(10)
  result = 'M' * m 
  result += conv(c, 'C', 'D', 'M')
  result += conv(x, 'X', 'L', 'C')
  result += conv(n, 'I', 'V', 'X')
  result
end

cnt = Hash.new(0)
1.upto(3999){|n| 
  #str = roman(n)
  #if str.size == 12
  #  puts n, "-", str
  #end
  cnt[roman(n).size] += 1
}
puts cnt
puts cnt[N]
