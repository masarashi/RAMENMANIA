require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @shop = shops(:one)
  end

  test "should get new" do
    get new_shop_path
    assert_response :success
  end

end
