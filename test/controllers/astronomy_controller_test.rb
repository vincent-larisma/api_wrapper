require "test_helper"

class AstronomyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get astronomy_index_url
    assert_response :success
  end
end
