defmodule AdamsCal do
  @population [
         5381733,  1308265,  1279594,  2333899,  1023119,  1123891,
         1914039,  2916976,  1974255,  1973115,  7266534,  6222666,
        13515271,  9126214,  2304264,  1066328,  1154008,   786740,
          834930,  2098804,  2031903,  3700305,  7483128,  1815865,
         1412916,  2610353,  8839469,  5534800,  1364316,   963579,
          573441,   694352,  1921525,  2843990,  1404729,   755733,
          976263,  1385262,   728276,  5101556,   832832,  1377187,
         1786170,  1166338,  1104069,  1648177,  1433566
  ]
  #@testdt [250, 200, 150]
  #@testans 10
  def run(select \\ 289) do
    #IO.puts "#{inspect @population}"
    seats = binary_search(1, Enum.max(@population), select)
    IO.puts "ans: #{inspect seats}"
  end


  def binary_search(low, high, select) do
    mid = (low + high)/2
    seats = Enum.map(@population, fn pop -> ceil(pop/mid) end)
    total_seats = Enum.sum(seats)
    mid = trunc(mid)
    #IO.puts("mid:#{mid}, seats:#{inspect seats},total:#{total_seats}")
    cond do
      select == total_seats ->
                  seats
      select > total_seats -> 
                  binary_search(low, mid, select)
      true      ->
                  binary_search(low + 1, high, select)
    end

  end
end