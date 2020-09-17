require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  def setup
    @shop = Shop.new(name: "shop one", pref: "Ishikawa", address: "Kanazawa", phone: "076-286-5603", description: "First Shop")
  end

  test "should be valid" do
    assert @shop.valid?
  end

  test "name should be present" do
    @shop.name = " "
    assert_not @shop.valid?
  end

  test "name should not be too long" do
    @shop.name = "a" * 65
    assert_not @shop.valid?
  end

  test "pref should not be too long" do
    @shop.pref = "a" * 17
    assert_not @shop.valid?
  end

  test "address should not be too long" do
    @shop.address = "a" * 257
    assert_not @shop.valid?
  end

  test "phone should not be too long" do
    @shop.phone = "0" * 17
    assert_not @shop.valid?
  end

  test "description should not be too long" do
    @shop.phone = "a" * 513
    assert_not @shop.valid?
  end

  test "associated menus should be destroyed" do
    @shop.save
    @shop.menus.create!(name: "Shoyu Ramen", price: "999")
    assert_difference 'Menu.count', -1 do
      @shop.destroy
    end
  end
  
end
