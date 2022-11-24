require 'nokogiri'
require 'open-uri'
# Контроллер для запросов к нашему "API"
class ProxyController < ApplicationController
  before_action :parse_params, only: :output
  before_action :prepare_url, only: :output
  def input; end

  def output
    api_response = URI.parse(@url).open
    case @side
    when 'server'
      @result = xslt_transform(api_response).to_html
    when 'client-with-xslt'
      render xml: insert_browser_xslt(api_response).to_xml, content_type:
     'application/xhtml+xml; charset=utf-8'
    else
      render xml: api_response, content_type: 'application/xhtml+xml; charset=utf-8'
    end
  end

  private

  BASE_API_URL = 'http://localhost:3000/?format=xml'.freeze
  XSLT_SERVER_TRANSFORM = "#{Rails.root}/public/server_transform.xslt".freeze
  XSLT_BROWSER_TRANSFORM = '/browser_transform.xslt'.freeze
  def parse_params
    @max_n = params[:max_n].to_i
    @side = params[:side]
  end

  def prepare_url
    @url = BASE_API_URL + "&max_n=#{@max_n}"
  end

  def xslt_transform(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: XSLT_BROWSER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    "type=\"text/xsl\" href=\"#{transform}\"")
    doc.root.add_previous_sibling(xslt)
    # Возвращаем doc, так как предыдущая операция возвращает не XML-документ.
    doc
  end
end
