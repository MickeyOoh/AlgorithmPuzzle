N = 11
q = 1

# 指定した桁数の円周率を整数で取得
pi = "314159265358"[0, N + 1].to_i
pow = 10 ** N

while true do
  if q * pi /pow != q * (pi + 1) / pow
    # 商が一致した場合
    if q * (pi + 1) % pow > 0
      puts q 
      exit
    end
  end
  q += 1
end
