def trap(x_a, x_b, n_divisions, f_lambda = nil, &f_block)
  func = f_lambda || f_block
  range = (x_b - x_a).to_f
  dx = range / n_divisions
  sum = (x_a...x_b).step(dx).reduce do |acc, x|
    acc + func.call(x)
  end
  dx * (((func.call(x_a) + func.call(x_b)) / 2) + sum)
end
