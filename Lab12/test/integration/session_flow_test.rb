require 'test_helper'

class SessionFlowTest < ActionDispatch::IntegrationTest
  test 'unauthorized user will be redirected to login page' do
    get simons_input_path
    assert_redirected_to controller: :session, action: :login
  end

  test 'user with incorrect credentials will be redirected to login page' do
    post session_create_url, params: { username: Faker::Lorem.word, password: Faker::Lorem.word }
    assert_redirected_to controller: :session, action: :login
  end

  test 'user with correct credentials will see the root' do
    password = Faker::Lorem.word

    user = User.create(username: Faker::Lorem.word, password_digest: password, last_login_at: DateTime.now)

    post users_url, params: { user: { login: user.username, password: password, last_login: user.last_login_at } }

    get simons_input_path
    assert_response :success
  end

  test 'user can logout' do
    password = Faker::Lorem.word

    user = User.create(username: Faker::Lorem.word, password_digest: password, last_login_at: DateTime.now)

    post users_url,
         params: { user: { username: user.username, password_digest: password, last_login: user.last_login_at } }

    get session_logout_url

    get simons_input_path

    assert_redirected_to controller: :session, action: :login
  end
end
