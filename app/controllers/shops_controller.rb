class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
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
    Shop.dinf(params[:id]).destroy
    flash[:success] = "削除されました"
    redirect_to shops_path
  end

  private

    def shop_params
      params.require(:shop).permit(:name, :pref, :address, :phone, :description, :image)
    end
end
