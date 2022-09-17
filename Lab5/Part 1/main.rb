def func(param_x, param_y)
  numerator = 2 * Math.cos(param_x - (Math::PI / 6))
  denominator = 0.5 + Math.sin(param_y)**2
  numerator / denominator
end
