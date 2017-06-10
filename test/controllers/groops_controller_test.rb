require 'test_helper'

class GroopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get groops_index_url
    assert_response :success
  end

end
