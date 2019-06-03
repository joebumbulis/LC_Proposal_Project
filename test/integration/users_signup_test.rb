require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get create_account_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {  username: "",
        email: "user@invalid",
        password: "fooo",
        password_confirmation: "barr" }}
      end

    assert_template 'users/new'
    # assert_select 'div#<CSS id for error explanation>'
    # assert_select 'div.<CSS class for field with error>'
  end

  test "valid signup information" do
    get create_account_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "ExampleExample",
                                                  email: "new_example@example.com",
                                                  password: "password",
                                                  password_confirmation: "password"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert flash[:success]
  end
end
