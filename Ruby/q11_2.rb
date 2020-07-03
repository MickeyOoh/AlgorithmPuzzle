N = 7

def vote(n)
  return 1 if n <= 2
  v1 = vote(n - 1)
  v2 = 0
  2.upto(n - 1) do |i|
    v2 += vote(i)
  end
  1 + v1 + v2 * v1
end

puts vote(N)
