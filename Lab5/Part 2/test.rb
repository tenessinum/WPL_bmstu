require 'minitest/autorun'
require_relative 'main'

# Function tester
class Test < Minitest::Test
  def self.gen_word
    ('a'..'z').to_a.sample(rand(2..14)).join
  end

  def self.gen_string
    words = []
    rand(4..17).times { words << Test.gen_word }
    words.join(' ')
  end

  def test_generated
    strings = []
    rand(4..17).times { strings << Test.gen_string }
    rewrite(strings)
  end
end
