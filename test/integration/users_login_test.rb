require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "login with remembering" do
   log_in_as(@user, remember_me: '1')
   assert_not_empty cookies[:remember_token]
 end

 test "login without remembering" do
   # Log in to set the cookie.
   log_in_as(@user, remember_me: '1')
   # Log in again and verify that the cookie is deleted.
   log_in_as(@user, remember_me: '0')
   assert_empty cookies[:remember_token]
 end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end
end
