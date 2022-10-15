require_relative 'main'

puts('Вводите строки, как закончите - нажмите Enter')

input = gets.chomp
i_strings = []

while input != ''
  i_strings.push(input)
  input = gets.chomp
end

i_strings.each do |string|
  print('Исходная строка: ', string, "\nСтрока после обработки: ", refactor_string(string), "\n")
end
