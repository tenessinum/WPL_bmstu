require 'test_helper'

# test class for simons hypothesis
class SimonsHypothesisControllerTest < ActionDispatch::IntegrationTest
  test 'can see the input page' do
    get '/'
    assert_select 'h1', { text: 'Гипотеза Симона' }, 'Что-то не то загрузилось'
  end

  test 'can get result' do
    get '/simons_hypothesis/result.json',
        params: { max_n: 1000 }
    assert_equal 'Array', response.parsed_body['type'], 'Что-то не то пришло'
    assert_equal 720, response.parsed_body['value'][3]['f'], 'Неправильный ответ'
    assert_response :success
  end
end
