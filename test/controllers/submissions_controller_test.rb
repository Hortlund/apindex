require "test_helper"

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get submissions_index_url
    assert_response :success
  end

  test "should get create" do
    get submissions_create_url
    assert_response :success
  end
end
