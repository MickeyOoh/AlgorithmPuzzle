N = 30

# 
def check(num) 
  #        0  1  2  3  4  5  6  7  8  9
  light = [6, 2, 5, 5, 4, 5, 6, 3, 7, 6]
  light[num/10] + light[num % 10]
end

cnt = 0
24.times do |n|
  60.times do |m| 
    60.times do |s|
      cnt += 1 if check(n) + check(m) + check(s) == N 
    end
  end
end
puts cnt
