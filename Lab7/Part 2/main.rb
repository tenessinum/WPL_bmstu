# Class patient
class Patient
  attr_reader :surname
  attr_accessor :age

  def initialize(surname, age)
    @surname = surname
    @age = age
  end

  def print
    puts "Больной с фамилией - #{@surname}, возраст - #{age}"
  end
end

# Class patient with examination
class ExaminationPatient < Patient
  attr_accessor :last_examination_year

  def initialize(surname, age, last_examination_year)
    super surname, age
    @last_examination_year = last_examination_year
  end

  def next_examination_year
    @last_examination_year + 3
  end

  def print
    super
    puts "Год последней диспансеризации - #{@last_examination_year}, год следующей - #{next_examination_year}"
  end
end
