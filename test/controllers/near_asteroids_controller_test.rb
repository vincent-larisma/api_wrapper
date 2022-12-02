require "test_helper"

class NearAsteroidsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get near_asteroids_index_url
    assert_response :success
  end

  test "should get show" do
    get near_asteroids_show_url
    assert_response :success
  end
end
