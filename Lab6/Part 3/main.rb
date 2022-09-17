def root(left, right, step, equal, f_lambda = nil, &f_block)
  func = f_lambda || f_block
  eq_root = nil

  while left <= right
    if (func.call(left) - equal).abs <= 0.1
      eq_root = left
      break
    end
    left += step
  end

  eq_root
end
