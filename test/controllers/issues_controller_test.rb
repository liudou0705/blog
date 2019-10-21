require 'test_helper'

class IssuesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get issues_show_url
    assert_response :success
  end

end
