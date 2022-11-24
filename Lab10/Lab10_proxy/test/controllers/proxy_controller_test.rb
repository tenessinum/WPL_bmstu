require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test 'should get html' do
    get '/proxy/output', params: { max_n: 1000, side: 'server' }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'text/html; charset=utf-8'
  end
  test 'should get xml for client' do
    get '/proxy/output', params: { max_n: 1000, side: 'client' }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xhtml+xml; charset=utf-8'
  end
  test 'should get xml+xslt for client' do
    get '/proxy/output', params: { max_n: 1000, side: 'client-with-xslt' }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xhtml+xml; charset=utf-8'
  end
end
