require "test_helper"

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teachers_index_url
    assert_response :success
  end

  test "should get show" do
    get teachers_show_url
    assert_response :success
  end

  test "should get edit" do
    get teachers_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get teachers_confirm_url
    assert_response :success
  end
end
