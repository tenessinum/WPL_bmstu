require "test_helper"

class RkControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get rk_input_url
    assert_response :success
  end

  test "should get result" do
    get rk_result_url
    assert_response :success
  end
end
