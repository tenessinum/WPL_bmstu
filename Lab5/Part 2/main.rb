def analyse_temperature(dates, temperatures)
  dates.zip(temperatures).select do |_date, temperature|
    temperature < -10
  end
end

def pretty_print(temp_data)
  puts("Дата\tтемпература")
  temp_data.each do |row|
    print(row[0], "\t", row[1], "\n")
  end
end
