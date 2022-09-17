require 'minitest/autorun'
require_relative 'main'

# Function tester
class Test < Minitest::Test
  def test_first
    result = func 1
    assert_in_epsilon 1.71594, result, 0.001, 'Неправильный результат'
  end

  def test_second
    result = func(-5)
    assert_in_epsilon 9023.38099, result, 0.001, 'Неправильный результат'
  end
end
