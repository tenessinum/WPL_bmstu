require 'minitest/autorun'
require_relative 'main'

# Sum tester
class Test < Minitest::Test
  def test_first
    result = calc_sum 0.01
    assert_in_delta 1.0 / (3 * ((1..3).inject(:*) || 1)), result, 0.01, 'Неправильный результат'
  end

  def test_second
    result = calc_sum 0.001
    assert_in_delta 1.0 / (3 * ((1..3).inject(:*) || 1)), result, 0.001, 'Неправильный результат'
  end
end
