N = 7

def vote(n)
  return 1 if n <= 2
  cnt = 1
  cnt += vote(n - 1)
  2.upto(n - 1) do |i|
    cnt += vote(i) * vote(n - 1)
  end
  cnt
end
2.upto(N) do |n|
  puts vote(n)
end