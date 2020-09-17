require 'test_helper'

class MenusEditTest < ActionDispatch::IntegrationTest

  def setup
    @menu = menus(:one)
  end

  test "unsuccessful edit" do
    get edit_menu_path(@menu)
    assert_template 'menus/edit'
    name = ""
    price = "999999"
    description = "a" * 65
    patch menu_path, params: { menu: { name: name, price: price, description: description} }
    assert_select "div.alert", count: 1
    assert_template 'menus/edit'
  end

  test "successful edit" do
    get edit_menu_path(@menu)
    assert_template 'menus/edit'
    name = "Shoyu Ramen"
    price = "1000"
    description = "Awesome!"
    patch menu_path, params: { menu: { name: name, price: price, description: description} }
    assert_not flash.empty?
    assert_redirected_to @menu.shop
    @menu.reload
    assert_equal name, @menu.name
    assert_equal price, @menu.price.to_s
    assert_equal description, @menu.description
  end
end
