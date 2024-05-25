require "test_helper"

class ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get review_show_url
    assert_response :success
  end

  test "should get edit" do
    get review_edit_url
    assert_response :success
  end
end
