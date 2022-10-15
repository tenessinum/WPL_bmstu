require_relative 'main'

temperatures = []
dates = []

puts('Введите информацию о температуре (в формате "dd.mm.yyyy температура" через Enter), как закончите - нажмите Enter')

input = gets.chomp

while input != ''
  temp = input.split
  dates.push(temp[0])
  temperatures.push(temp[1].to_f)
  input = gets.chomp
end

result = analyse_temperature(dates, temperatures)
pretty_print(result)
