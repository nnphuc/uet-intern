require 'test_helper'

class StudentInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_info = student_infos(:one)
  end

  test "should get index" do
    get student_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_student_info_url
    assert_response :success
  end

  test "should create student_info" do
    assert_difference('StudentInfo.count') do
      post student_infos_url, params: { student_info: {  } }
    end

    assert_redirected_to student_info_url(StudentInfo.last)
  end

  test "should show student_info" do
    get student_info_url(@student_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_info_url(@student_info)
    assert_response :success
  end

  test "should update student_info" do
    patch student_info_url(@student_info), params: { student_info: {  } }
    assert_redirected_to student_info_url(@student_info)
  end

  test "should destroy student_info" do
    assert_difference('StudentInfo.count', -1) do
      delete student_info_url(@student_info)
    end

    assert_redirected_to student_infos_url
  end
end
