require "test_helper"

class AdminPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_pages_home_url
    assert_response :success
  end

  test "should get agency" do
    get admin_pages_agency_url
    assert_response :success
  end
end
