require_relative 'main'

strings = []

puts('Вводите строки, как закончите - нажмите Enter')

input = gets.chomp

while input != ''
  strings.push(input)
  input = gets.chomp
end

print(rewrite(strings))
