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
end
