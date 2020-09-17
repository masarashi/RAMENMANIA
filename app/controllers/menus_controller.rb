class MenusController < ApplicationController

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @menu = @shop.menus.build
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @menu = @shop.menus.build(menu_params)
    if @menu.save
      flash[:info] = "登録が完了しました"
      redirect_to @shop
    else
      render "new"
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
        flash[:success] = "情報が更新されました"
        redirect_to @menu.shop
    else
        render 'edit'
    end
  end

  def destroy
    Menu.find(params[:id]).destroy
    flash[:success] = "削除されました"
    redirect_back(fallback_location: shop_path)
  end

  private

    def menu_params
      params.require(:menu).permit(:name, :price, :description)
    end
end
