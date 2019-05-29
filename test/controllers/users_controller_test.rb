require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Proposal Project App"
    @user = User.first
  end

  test "should get index" do
    get users_path
    assert_response :success
    assert_select "title", "Users | #{@base_title}"
  end

  test "should get new" do
    get create_account_path
    assert_response :success
    assert_select "title", "New User | #{@base_title}"
  end

  test "should get show" do
    get user_path(@user)
    assert_response :success
    assert_select "title", "User Page | #{@base_title}"
  end

  test "should get edit" do
    get edit_user_path(@user)
    assert_response :success
  end
end
