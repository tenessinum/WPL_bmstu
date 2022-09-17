require 'minitest/autorun'
require_relative 'main'

# Class tester
class Test < Minitest::Test
  def setup
    super
    @name = Word.new 'Igor'
    @measured_name = MeasuredWord.new 'Egor'
  end

  def test_hierarchy
    assert_kind_of Word, @measured_name
  end
end
