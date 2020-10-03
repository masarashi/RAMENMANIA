module MenusHelper

  def current_shop
    @shop = Shop.find(params[:shop_id])
  end

  def menu_admin?(user)
    user && user.id == current_shop.user_id
  end
end
