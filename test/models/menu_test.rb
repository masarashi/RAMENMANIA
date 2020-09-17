require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  def setup
    @shop = shops(:one)
    @menu = @shop.menus.build(name: "Ramen One", price: "500", description: "Deslicious!")
  end

  test "should be valid" do
    assert @menu.valid?
  end

  test "name should be present" do
    @menu.name = " "
    assert_not @menu.valid?
  end

  test "name should not be too long" do
    @menu.name = "a" * 65
    assert_not @menu.valid?
  end
  
  test "price should be integer" do
    @menu.price = '-100'
    assert_not @menu.valid?
  end

  test "price should not be too expensive" do
    @menu.price = "1" * 6
    assert_not @menu.valid?
  end

  test "description should not be too long" do
    @menu.description = "a" * 65
    assert_not @menu.valid?
  end
end
