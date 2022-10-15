def calc_int(accuracy)
  sum = 0.0
  left = 1.0
  right = 2.0
  k = 0

  loop do
    sum += Math.log(left)
    left += accuracy
    k += 1
    break if left >= right
  end

  [sum / k, k]
end
