class ShopsController < ApplicationController
  include ShopsHelper

  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :shop_admin, only: [:edit, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_menus = @shop.menus.all.order(name: :asc)
  end

  def new
    @shop = Shop.new
  end

  def create
    @user = current_user
    @shop = @user.shops.build(shop_params)
    if @shop.save
      flash[:info] = "登録が完了しました"
      redirect_to shops_path
    else
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:success] = "情報が更新されました"
      redirect_to @shop
    else
      render 'edit'
    end
  end

  def destroy
    Shop.find(params[:id]).destroy
    flash[:success] = "削除されました"
    redirect_to shops_path
  end

  private

    def shop_params
      params.require(:shop).permit(:name, :prefecture_code, :address, :phone, :description, :image)
    end

    def shop_admin
      redirect_to(root_url) unless shop_admin?(current_user)
    end
end
