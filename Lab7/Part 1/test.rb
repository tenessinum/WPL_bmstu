require 'minitest/autorun'
require_relative 'main'

# File rewriter tester
class Test < Minitest::Test
  def initialize(name)
    super name
    @filename = 'F.txt'
    @ints = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10,
             1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1]
  end

  def test_create
    create_file_f(@ints)
    assert_path_exists @filename
  end

  def test_second_variant
    create_file_f(@ints)
    create_file_p(2)
    result = File.readlines('P.txt', chomp: true).join(' ')
    assert_equal '10 9 8 7 6 5 4 3 2 1 1 2 3 4 5 6 7 8 9 10 ' \
                 '-1 -2 -3 -4 -5 -6 -7 -8 -9 -10 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1',
                 result, 'Программа отработала неверно'
  end

  def test_first_variant
    create_file_f(@ints)
    create_file_p(1)
    result = File.readlines('P.txt', chomp: true).join(' ')
    assert_equal '10 9 8 7 6 -1 -2 -3 -4 -5 5 4 3 2 1 -6 -7 -8 -9 -10 ' \
                 '1 2 3 4 5 -10 -9 -8 -7 -6 6 7 8 9 10 -5 -4 -3 -2 -1',
                 result, 'Программа отработала неверно'
  end
end
