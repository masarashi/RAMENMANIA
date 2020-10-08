require 'test_helper'

class ShopsEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:john)
    @shop = shops(:one)
  end

  # test "unsuccessful edit" do
  #   sign_in(@user)
  #   get edit_shop_path(@shop)
  #   assert_template 'shops/edit'
    # patch shop_path(@shop), params: { shop: { name: "",
    #                                         prefecture_code: "17",
    #                                         address: "Kanazawa-Shi",
    #                                         phone: "100-000-0000",
    #                                         description: "1st Shop" } }
    # assert_template 'shops/edit'                                        
  # end

  # test "successful edit" do
  #   get edit_shop_path(@shop)
  #   assert_template 'shops/edit'
  #   name = "Ramen Shop One"
  #   prefecture_code = "17"
  #   address = "Kanazawa-Shi"
  #   phone = "100-000-0000"
  #   description = "1st Shop"
  #   patch shop_path(@shop), params: { shop: { name: name,
  #                                           prefecture_code: 17,
  #                                           address: address,
  #                                           phone: phone,
  #                                           description: description } }
  #   assert_not flash.empty?
  #   assert_redirected_to @shop
  #   @shop.reload
  #   assert_equal name, @shop.name
  #   assert_equal pref, @shop.pref
  #   assert_equal address, @shop.address
  #   assert_equal phone, @shop.phone
  #   assert_equal description, @shop.description
  # end
end
