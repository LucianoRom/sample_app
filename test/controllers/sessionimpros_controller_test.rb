require 'test_helper'

class SessionimprosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessionimpros_new_url
    assert_response :success
  end

  test "should get newuser" do
    get sessionimpros_newuser_url
    assert_response :success
  end

end
