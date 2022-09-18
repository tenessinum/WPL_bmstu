require 'minitest/autorun'
require_relative 'main'

# Class tester
class Test < Minitest::Test
  def test_hierarchy
    examination_patient = ExaminationPatient.new 'Нуруллаев', 19, 2021
    assert_kind_of Patient, examination_patient
  end
end
