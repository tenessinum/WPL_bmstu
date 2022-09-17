require 'minitest/autorun'
require_relative 'main'

# Solver testing
class Test < Minitest::Test
  def test_f1_lambda
    f1 = ->(x) { x**2 + Math.sin(x / 2) }
    assert_in_epsilon(-0.646, root(-1, 1, 0.001, 0, f1), 1e-4)
  end

  def test_f1_block
    assert_in_epsilon(-0.646, root(-1, 1, 0.001, 0) { |x| x**2 + Math.sin(x / 2) }, 1e-4)
  end

  def test_f2_lambda
    f2 = ->(x) { Math.atan(x) + x }
    assert_in_epsilon(0.465, root(0, 2, 0.001, 1, f2), 1e-4)
  end

  def test_f2_block
    assert_in_epsilon(0.465, root(0, 2, 0.001, 1) { |x| Math.atan(x) + x }, 1e-4)
  end
end
