def calc_sum(accuracy)
  series(accuracy).take_while { |prev_step| prev_step.abs > accuracy }.last[2]
end

def series(accuracy)
  Enumerator.new do |yielder|
    sum = 0.0
    step = 0.0
    prev_step = 2 * accuracy
    k = 0

    loop do
      k += 1
      step = 1.0 / (k * (k + 1) * (k + 2) * (k + 3))
      sum += step
      yielder.yield prev_step, step, sum
      prev_step = step
    end
  end
end
