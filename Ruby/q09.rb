N = 8

# 探索すべき最大桁を調査
keta = 1 
while true do
  break if keta * ((N - 1) ** keta) < N ** (keta - 1)
  keta += 1
end
puts keta

cnt = 0
N.upto(N ** keta) do |i|

  value = i.to_s(N)
  len = value.length
  sum = 0
  len.times do |d|
    sum += value[d].to_i(N) ** len
  end
  if i == sum
    puts value
    cnt += 1
    break if cnt == N
  end
end
