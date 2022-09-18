require 'minitest/autorun'
require_relative 'main'

# File tester
class Test < Minitest::Test
  def initialize(name)
    super name
    @first_file_name = 'F.txt'
    @second_file_name = 'G.txt'
    @output_file = 'H.txt'
  end

  def test_create
    create_file(@first_file_name, 'test string')
    assert_path_exists @first_file_name, 'Не получилось создать файл'
  end

  def test_first_variant
    create_file(@first_file_name, 'test string1')
    create_file(@second_file_name, 'test string2')
    write_matches_to_file(@first_file_name, @second_file_name, @output_file)

    assert_path_exists @output_file, 'Файл не был создан'
    result = File.read(@output_file)
    assert_equal 'test string', result, 'Программа отработала неверно'
  end

  def test_second_variant
    create_file(@first_file_name, 'test string')
    create_file(@second_file_name, 'string test')
    write_matches_to_file(@first_file_name, @second_file_name, @output_file)

    assert File.file?(@output_file), 'Файл не должно быть так как нет совпадающих начальных компонентов'
  end
end
