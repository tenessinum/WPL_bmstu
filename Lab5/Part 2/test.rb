require 'minitest/autorun'
require_relative 'main'

# Function tester
class Test < Minitest::Test
  def self.gen_array(param_k)
    array = []
    rand((param_k + 2)..(param_k + 10)).times { array.push(rand(-10..10)) }
    array
  end

  def test_generated
    k = rand(4..10)
    array = Test.gen_array(k)
    print('Для массива ', array, ' и k = ', k, " результат:\n")
    result = get_k_min_max(array, k)
    print('k наименьших - ', result[0], ' и k наибольших - ', result[1])
    assert result[0].length == k && result[1].length == k
  end
end
