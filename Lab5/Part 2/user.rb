require_relative 'main'

array = []

puts('Введите K')

k = gets.chomp.to_i

puts('Теперь вводите элементы массива (через Enter), как закончите - нажмите Enter')

input = gets.chomp

while input != ''
  array.push(input.to_i)
  input = gets.chomp
end

result = get_k_min_max(array, k)

print(k, ' наименьших - ', result[0].join(', '), ', а ', k, ' наибольших - ', result[1].join(', '))
