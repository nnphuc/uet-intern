require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get student_info" do
    get home_student_info_url
    assert_response :success
  end

end
