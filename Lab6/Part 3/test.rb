require 'minitest/autorun'
require_relative 'main'

# Integral testing
class Test < Minitest::Test
  def test_f1_lambda
    f1 = ->(x) { x + Math.cos(x) }
    assert_in_epsilon 7.58467, trap(-1, 4, 10_000, f1), 1e-3
  end

  def test_f1_block
    assert_in_epsilon 7.58467, trap(-1, 4, 10_000) { |x| x + Math.cos(x) }, 1e-3
  end

  # для второй функции интеграл расходящийся
end
