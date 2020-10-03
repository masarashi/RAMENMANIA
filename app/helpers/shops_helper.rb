module ShopsHelper

  def current_shop
    @shop = Shop.find(params[:id])
  end

  def shop_admin?(user)
    user && user.id == current_shop.user_id
  end
end
