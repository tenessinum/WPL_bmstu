def calc_int(accuracy)
  series(accuracy).take_while { |left, right| left < right }.last[2]
end

def series(accuracy)
  Enumerator.new do |yielder|
    sum = 0.0
    left = 1.0
    right = 2.0
    k = 0

    loop do
      k += 1
      sum += Math.log(left)
      left += accuracy
      yielder.yield left, right, sum / k
    end
  end
end
