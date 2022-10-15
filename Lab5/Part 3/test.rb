require 'minitest/autorun'
require_relative 'main'

# Function tester
class Test < Minitest::Test
  def self.gen_word
    (0...(rand(3..6))).map { ('0'..'z').to_a[rand(62)] }.join
  end

  def self.gen_string
    (5..20).map { Test.gen_word }.join(' ')
  end

  def self.check_word(word)
    word[0] = 'a' if word[0] == '_'
    word.match(/^[a-zA-Z0-9_\-+ ]*$/)
  end

  def test_first
    result = refactor_string(Test.gen_string)
    assert result.split.all? { |word| Test.check_word(word) }, 'Неправильный результат'
  end
end
