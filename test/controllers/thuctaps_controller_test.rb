require 'test_helper'

class ThuctapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thuctap = thuctaps(:one)
  end

  test "should get index" do
    get thuctaps_url
    assert_response :success
  end

  test "should get new" do
    get new_thuctap_url
    assert_response :success
  end

  test "should create thuctap" do
    assert_difference('Thuctap.count') do
      post thuctaps_url, params: { thuctap: { address: @thuctap.address, content: @thuctap.content, endtime: @thuctap.endtime, partner_id: @thuctap.partner_id, tag: @thuctap.tag, title: @thuctap.title } }
    end

    assert_redirected_to thuctap_url(Thuctap.last)
  end

  test "should show thuctap" do
    get thuctap_url(@thuctap)
    assert_response :success
  end

  test "should get edit" do
    get edit_thuctap_url(@thuctap)
    assert_response :success
  end

  test "should update thuctap" do
    patch thuctap_url(@thuctap), params: { thuctap: { address: @thuctap.address, content: @thuctap.content, endtime: @thuctap.endtime, partner_id: @thuctap.partner_id, tag: @thuctap.tag, title: @thuctap.title } }
    assert_redirected_to thuctap_url(@thuctap)
  end

  test "should destroy thuctap" do
    assert_difference('Thuctap.count', -1) do
      delete thuctap_url(@thuctap)
    end

    assert_redirected_to thuctaps_url
  end
end
