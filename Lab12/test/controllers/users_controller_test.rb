require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @password = Faker::Lorem.word
    @user = User.create(username: Faker::Lorem.word, password: @password, last_login_at: DateTime.now)
    post users_url, params: { user: { login: @user.username, password: @password, last_login: @user.last_login_at } }
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url,
           params: { user: { last_login_at: DateTime.now, password: Faker::Lorem.word,
                             username: Faker::Lorem.word } }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user),
          params: { user: { last_login_at: @user.last_login_at, password: @password + Faker::Lorem.word,
                            username: @user.username + Faker::Lorem.word } }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
