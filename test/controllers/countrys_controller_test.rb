require "test_helper"

class CountrysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get countrys_index_url
    assert_response :success
  end

  test "should get edit" do
    get countrys_edit_url
    assert_response :success
  end
end
