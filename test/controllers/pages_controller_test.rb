require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "RON95"
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
    assert_select "title", "About Harga Minyak"
  end

end
