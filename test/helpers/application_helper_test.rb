require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Proposal Project App"
    assert_equal full_title("Help"), "Help | Proposal Project App"
    assert_equal full_title("New User"), "New User | Proposal Project App"
  end
end
