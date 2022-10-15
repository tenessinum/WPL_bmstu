require 'minitest/autorun'
require_relative 'main'

# Function tester
class Test < Minitest::Test
  def self.gen_temperatures
    [10, 9, 5, 0, -2, -5, -10, -11, -12, -15, -5, 0, 4, 6]
  end

  def self.gen_dates
    ['15.20.2022', '16.20.2022', '17.20.2022', '18.20.2022', '19.20.2022', '20.20.2022', '21.20.2022', '22.20.2022',
     '23.20.2022', '24.20.2022', '25.20.2022', '26.20.2022', '27.20.2022', '28.20.2022']
  end

  def test_generated
    result = analyse_temperature(Test.gen_dates, Test.gen_temperatures)
    assert_equal result, [['22.20.2022', -11], ['23.20.2022', -12], ['24.20.2022', -15]]
  end
end
