# Simon's hypothesis
class ApiController < ActionController::Base
  before_action :parse_params, only: :result

  def initialize
    super
    @simons = Enumerator.new do |steps|
      a1 = 1
      a2 = 2
      a3 = 3
      iteration = 1

      loop do
        fact = a1 * a2 * a3
        steps << { iteration: iteration, f: fact, a1: a1, a2: a2, a3: a3, fits: factorial?(fact) }
        a1 = a2
        a2 = a3
        a3 += 1
        iteration += 1
      end
    end
  end

  def result
    numbers = @simons.take_while { |step| step[:iteration] < @max_n }.select { |step| step[:fits] }

    respond_to do |format|
      format.xml { render xml: numbers.to_xml }
      format.rss { render xml: numbers.to_xml }
    end
  end

  protected

  def parse_params
    @max_n = params[:max_n].to_i
  end

  private

  def factorial?(number)
    i = 1
    n = number.to_f
    while (n % i).zero?
      n /= i
      i += 1
    end

    n == 1
  end
end
