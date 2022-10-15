require 'minitest/autorun'
require_relative 'main'

# Function tester
class Test < Minitest::Test
  def test_first
    result = func 4.0
    assert_in_epsilon 49.30704, result, 0.001, 'Неправильный результат'
  end

  def test_second
    result = func 5.0
    assert_in_epsilon 136.66162, result, 0.001, 'Неправильный результат'
  end
end
