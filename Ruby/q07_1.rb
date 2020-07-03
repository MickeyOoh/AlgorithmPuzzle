N = 15

# 順列計算
def nPr(n, r)
  result = 1
  r.times do |i|
    result *= n - i
  end
  result
end

cnt = 0
1.upto(N - 1) do |i|
  cnt += i * (N - i) * nPr(N, i - 1)
end
puts cnt.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')
