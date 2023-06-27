require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get email" do
    get user_email_url
    assert_response :success
  end

  test "should get password" do
    get user_password_url
    assert_response :success
  end

  test "should get login" do
    get user_login_url
    assert_response :success
  end
end
