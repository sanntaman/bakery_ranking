require "test_helper"

class NewControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get new_admin_url
    assert_response :success
  end

  test "should get reviews" do
    get new_reviews_url
    assert_response :success
  end
end
