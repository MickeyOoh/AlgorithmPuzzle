M, N = 9, 5

seq = []
(2..M).to_a.permutation(M - 1){|a| seq.push([1] + a)}

log = []
log.push(seq)

N.times do |i|
  seq = []
  log[i].each do |a|
    1.upto(M - 1) do |j|
      if a[j] == j + 1
        seq.push(a[0..j].reverse + a[(j + 1)..-1])
      end
    end
  end
  log.push(seq)
end
puts log[N].size
