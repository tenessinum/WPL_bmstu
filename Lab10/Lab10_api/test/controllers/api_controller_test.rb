require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test 'can get rss' do
    get '/',
        params: { max_n: 1000, format: :rss }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end

  test 'can get xml' do
    get '/',
        params: { max_n: 1000, format: :xml }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xml'
  end
end
