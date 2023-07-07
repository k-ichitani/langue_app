require "test_helper"

class Admin::TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_teachers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_teachers_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get admin_teachers_confirm_url
    assert_response :success
  end
end
