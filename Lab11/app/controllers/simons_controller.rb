require 'nokogiri'

# api controller for simons hyp.
class SimonsController < ActionController::Base
  before_action :set_simons, only: %i[show edit update destroy]
  XSLT_SERVER_TRANSFORM = "#{Rails.root}/public/server_transform.xslt".freeze
  def input; end

  def index
    @simons = Simons.all

    respond_to do |format|
      format.html do
        render 'index'
      end
      format.xml do
        xml_arr = @simons.inject([]) { |acc, el| acc.append el.result }
        doc_result = Nokogiri::XML('<db></db>')
        xml_arr.each_with_object(doc_result) do |el, acc|
          el = Nokogiri::XML(el).search('result')
          acc.at('db').add_child(el)
        end
        render xml: doc_result
      end
    end
  end

  def show
    doc = Nokogiri::XML(@simons.result)
    xslt = Nokogiri::XSLT(File.read(XSLT_SERVER_TRANSFORM))
    @view = xslt.transform(doc).to_html
  end

  def new
    @simons = Simons.new
  end

  def create
    found_id = Simons.search_id(simons_params[:max_n])

    if found_id.nil?
      @simons = Simons.new(simons_params)
      @simons.result = make_output(simons_params[:max_n]) if @simons.valid?
      respond_to do |format|
        if @simons.save
          format.html do
            redirect_to @simons, notice: 'Расчет успешно произведен.'
          end
          format.json { render :show, status: :created, location: @simons }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json do
            render json: @simons.errors, status: :unprocessable_entity
          end
        end
      end
    else
      redirect_to action: 'show', id: found_id
    end
  end

  def destroy
    p 'deleting'
    @simons.destroy
    respond_to do |format|
      format.html do
        redirect_to simons_url, notice: 'Расчет успешно удален.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_simons
    @simons = Simons.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def simons_params
    params.require(:simons).permit(:max_n)
  end

  def make_output(input)
    input = Integer(input)
    return if input.nil?

    simons_enum = Enumerator.new do |steps|
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

    simons_hash = simons_enum.take_while { |step| step[:iteration] < input }.select { |step| step[:fits] }
    result = simons_hash.length

    output_hash = { result: result || 'Не найдено', simons: simons_hash }
    output_hash.to_xml(root: 'output')
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
end
