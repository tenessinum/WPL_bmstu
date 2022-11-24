require 'test_helper'

# simons model test
class SimonsTest < ActiveSupport::TestCase
  test 'check correct input' do
    simons = Simons.new(max_n: 12)
    assert simons.valid?
  end
  test 'check duplicated input' do
    simons1 = Simons.new(max_n: 11_122)
    simons2 = Simons.new(max_n: 11_122)
    assert simons1.save
    refute simons2.save
  end
  test 'check that record can be saved and read' do
    simons = Simons.new(max_n: 1234)
    assert simons.save
    assert Simons.find_by(max_n: 1234)
  end
end
