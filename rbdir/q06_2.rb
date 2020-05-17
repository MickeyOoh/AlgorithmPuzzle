W,N = 1000,20

def cut(w, h, n)
  return (n == 0) if w == h
  w, h = h, w if w > h
  q, r = h.divmod(w)
  if (n - q < 0) || (r == 0)
    return (n - q == 0)
  else
    return cut(w, r, n -q)
  end
end

cnt = 0
1.upto(W) do |i|
  1.upto(W) do |j|
    cnt += 1 if cut(i, j, N)
  end
end
puts cnt
