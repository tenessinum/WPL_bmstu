require 'minitest/autorun'
require_relative 'main'

# Integral tester
class Test < Minitest::Test
  def test_first
    result = calc_s 0.001
    assert_in_epsilon 0.3862943611199, result, 0.001, 'Неправильный результат'
  end

  def test_second
    result = calc_s 0.0001
    assert_in_epsilon 0.3862943611199, result, 0.0001, 'Неправильный результат'
  end
end
