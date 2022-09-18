def create_file(file_name, string)
  File.write(file_name, string)
end

def write_matches_to_file(first_file_name, second_file_name, output_file_name)
  first_enum = File.read(first_file_name).each_char
  second_enum = File.read(second_file_name).each_char
  matched = first_enum.zip(second_enum).take_while { |first_c, second_c| first_c == second_c }

  if matched.length.zero?
    puts('В файлах нет начальных совпадающих компонентов')
  else
    create_file(output_file_name, matched.transpose[0].join)
  end
end
