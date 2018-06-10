require 'test_helper'

class StudentInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_info_index_url
    assert_response :success
  end

  test "should get edit" do
    get student_info_edit_url
    assert_response :success
  end

end
