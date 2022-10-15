def create_file(file_name, string)
  File.write(file_name, string)
end

def process_file(input_file_name, output_file_name)
  if File.exist?(input_file_name)
    input_enum = File.readlines(input_file_name)
    create_file(output_file_name, input_enum.reverse.map { |string| string.tr('eErtU', '') }.join)
  else
    puts('Такого файла нет')
  end
end
