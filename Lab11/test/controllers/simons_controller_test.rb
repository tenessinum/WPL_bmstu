require 'test_helper'

# simons controller test
class SimonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @controller = SimonsController.new
  end

  test 'should get index' do
    get simons_path
    assert_response :success
  end

  test 'should get new' do
    get new_simon_path
    assert_response :success
  end

  test 'should create simons' do
    assert_difference('Simons.count', 1) do
      post simons_path, params: { 'simons[max_n]': 100 }
    end
  end

  test 'should show simons' do
    max_n = 100
    assert_difference('Simons.count', 1) do
      post simons_path, params: { 'simons[max_n]': max_n }
    end

    @simons = Simons.all[0]
    assert_equal @simons.max_n, max_n

    get simon_path(@simons)
    assert_response :success
  end

  test 'should destroy simons' do
    max_n = 100
    assert_difference('Simons.count', 1) do
      post simons_path, params: { 'simons[max_n]': max_n }
    end

    @simons = Simons.all[0]
    assert_equal @simons.max_n, max_n

    assert_difference('Simons.count', -1) do
      delete simon_path(@simons)
    end
    assert_redirected_to simons_path
  end

  test 'should get different outputs for different inputs' do
    output1 = @controller.send :make_output, '2'
    output2 = @controller.send :make_output, '10'
    assert_not_equal output1, output2
  end
end
