require 'minitest/autorun'
require_relative 'main'

# Integral testing
class Test < Minitest::Test
  def test_f1_lambda
    f1 = ->(x) { Math.log(x) / x }
    assert_in_epsilon(-2.65095, intg(0.1, 1, 10_000, f1), 1e-3)
  end

  def test_f1_block
    assert_in_epsilon(-2.65095, intg(0.1, 1, 10_000) { |x| Math.log(x) / x }, 1e-3)
  end

  def test_f2_lambda
    f2 = ->(x) { Math.sin(x) * Math.cos(x) }
    assert_in_epsilon 0.413411, intg(0, 2, 10_000, f2), 1e-3
  end

  def test_f2_block
    assert_in_epsilon 0.413411, intg(0, 2, 10_000) { |x| Math.sin(x) * Math.cos(x) }, 1e-3
  end
end
