def calc_sum(accuracy)
  sum = 0.0
  step = 0.0
  k = 1

  loop do
    step = 1.0 / (k * (k + 1) * (k + 2) * (k + 3))
    sum += step
    k += 1
    break if step < accuracy
  end

  [sum, k]
end
