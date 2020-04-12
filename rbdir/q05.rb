N = 45

def count(n)
  coin = [10000, 5000, 2000, 1000, 500, 100, 50, 10, 5, 1]
  result = 0
  coin.each do |c|

    cnt, n = n.divmod(c)
    result += cnt
  end
  result
end

row = [0] * (N + 1);
row[0] = 1;
N.times do |i|

  (i + 1).downto(1) do |j|

    row[j] += row[j - 1]
  end
end

puts row.map{|i| count(i)}.inject(:+)