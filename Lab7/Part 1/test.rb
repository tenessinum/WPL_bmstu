require 'minitest/autorun'
require_relative 'main'

# File tester
class Test < Minitest::Test
  def initialize(name)
    super name
    @input_file_name = 'F.txt'
    @output_file_name = 'G.txt'
  end

  def test_create
    create_file(@input_file_name, 'test string')
    assert_path_exists @input_file_name, 'Не получилось создать файл'
  end

  def self.create_string
    (0...(rand(10..20))).map { ('0'..'z').to_a[rand(62)] }.join
  end

  def self.check_result(string)
    %w[e E r t U].all? { |char| !string.include? char }
  end

  def test_first
    create_file('F.txt', (4..10).map { Test.create_string }.join("\n"))
    process_file(@input_file_name, @output_file_name)
    assert_path_exists @output_file_name, 'Файл не был создан'
    result = File.read(@output_file_name)
    assert Test.check_result(result), 'Программа отработала неверно'
  end
end
