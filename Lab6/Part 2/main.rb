def calc_s(accuracy)
  integral(accuracy / 2).take_while { |left, right| (right >= left) }.last[2] * accuracy / 2
end

def integral(accuracy)
  Enumerator.new do |yielder|
    sum = 0.0
    left = 1.0
    right = 2.0

    loop do
      yielder.yield left, right, sum
      sum += Math.log(left)
      left += accuracy
    end
  end
end
