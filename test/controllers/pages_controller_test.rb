require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Info Harga Minyak"
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
    assert_select "title", "About Harga Minyak"
  end

end
