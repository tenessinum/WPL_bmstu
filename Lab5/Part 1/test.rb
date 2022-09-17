require 'minitest/autorun'
require_relative 'main'

# Function tester
class Test < Minitest::Test
  def test_first
    result = func 1, 1
    assert_in_epsilon 1.47119, result, 0.01, 'Неправильный результат'
  end

  def test_second
    result = func 2, 3
    assert_in_epsilon 0.362579, result, 0.01, 'Неправильный результат'
  end
end
