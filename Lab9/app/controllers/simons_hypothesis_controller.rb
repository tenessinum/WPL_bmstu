# Simon's hypothesis
class SimonsHypothesisController < ActionController::Base
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

  def factorial?(number)
    i = 1
    n = number.to_f
    while (n % i).zero?
      n /= i
      i += 1
    end

    n == 1
  end

  def result
    @max_n = params[:max_n].to_i
    @result = @simons.take_while { |step| step[:iteration] < @max_n }.select { |step| step[:fits] }

    respond_to do |format|
      format.json do
        render json: {
          type: @result.class.to_s,
          value: @result
        }.as_json
      end
      format.xml do
        render xml: @result.to_xml
      end
    end
  end

  def input; end
end
