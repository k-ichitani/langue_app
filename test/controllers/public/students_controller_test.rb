require "test_helper"

class Public::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_students_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_students_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get public_students_confirm_url
    assert_response :success
  end
end
