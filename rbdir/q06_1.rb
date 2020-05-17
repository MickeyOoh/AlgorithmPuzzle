W, N = 8, 5

def cut(w, h)
  return 1 if w == h
  w, h = h, w if w > h
  q, r = h.divmod(w)
  result = q
  result += cut(w, r) if r > 0
  result
end

cnt = 0
1.upto(W) do |i| 
  1.upto(W) do |j|
    cnt += 1 if cut(i, j) == N
  end
end

puts cnt