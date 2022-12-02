require "test_helper"

class TechTransferControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tech_transfer_index_url
    assert_response :success
  end
end
