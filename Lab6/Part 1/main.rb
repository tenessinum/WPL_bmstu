def calc_s(accuracy)
  left = 1
  right = 2
  puts("Количество итераций для e = #{accuracy}: #{(right - left) / accuracy * 2}")

  integrate(left, right, accuracy / 2)
end

def integrate(left, right, step)
  sum = 0.0

  until left >= right
    sum += Math.log(left)
    left += step
  end

  sum * step
end
