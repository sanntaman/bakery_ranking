require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get reviews" do
    get admin_reviews_url
    assert_response :success
  end
end
