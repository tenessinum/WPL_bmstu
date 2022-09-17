require 'minitest/autorun'
require_relative 'main'

# Integral testing
class Test < Minitest::Test
  def test_first
    result = calc_s 0.001
    assert_in_epsilon 0.3862943611199, result, 0.001, 'Неправильный результат'
  end

  def test_second
    result = calc_s 0.0001 # для скрина убрать поставить точность 0.0001
    assert_in_epsilon 0.3862943611199, result, 0.0002, 'Неправильный результат'
  end
end
