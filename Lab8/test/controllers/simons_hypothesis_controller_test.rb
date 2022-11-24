require 'test_helper'

class SimonsHypothesisControllerTest < ActionDispatch::IntegrationTest
  test 'can see the input page' do
    get '/'
    assert_select 'h1', { text: 'Гипотеза Симона' }, 'Что-то не то загрузилось'
  end

  test 'can see result' do
    get '/simons_hypothesis/result',
        params: { max_n: 1000 }
    assert_response :success
    assert_select 'h1', { text: 'Результат' }, 'Что-то не то загрузилось'
    assert_select 'tr', { count: 5 }, 'Неправильная таблица'
  end
end
