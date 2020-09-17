require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest

  def setup
    @menu = menus(:one)
    @shop = shops(:one)
  end

  test "should get new" do
    get new_shop_menu_path(@shop)
    assert_response :success
  end
  
end
