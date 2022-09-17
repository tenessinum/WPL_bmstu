# Class word
class Word
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def count_length
    @value.length
  end

  def print
    puts "Word value: #{@value}"
  end
end

# Class word with length
class MeasuredWord < Word
  attr_reader :word_length

  def initialize(value)
    super value
    @word_length = @value.length
  end

  def value=(val)
    @value = val
    @word_length = val.length
  end

  def calc_consonants
    @value.split('').count{ |letter| !'aeiou'.include?(letter.downcase) }
  end

  def print
    super
    puts "Word length: #{@word_length}"
  end
end
