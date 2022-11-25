# RK controller
class RkController < ApplicationController
  def input; end

  def result
    @parsed_arr = params[:arr_b].chomp.split(' ')

    unless @parsed_arr.select { |e| not_a_number? e }.empty?
      @error_msg = 'Строка должна содержать только числа и пробелы!'
      return
    end

    @arr_b = @parsed_arr.map(&:to_i)

    if @arr_b.empty?
      @error_msg = 'Массив пустой('
      return
    end

    last_positive = @arr_b.reverse.find(&:positive?)

    if last_positive.nil?
      @error_msg = 'В массиве нет положительных элементов!'
      return
    end

    @result = ((@arr_b.length - 1) / 3) / last_positive.to_f
  end

  def not_a_number?(string)
    string.to_i.to_s != string && string.to_f.to_s != string
  end
end
