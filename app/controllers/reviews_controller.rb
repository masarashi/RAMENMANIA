class ReviewsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @user = current_user
    @review = @shop.reviews.build
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = @shop.reviews.build(review_params)
    if @review.save
      flash[:info] = "レビューを投稿しました"
      redirect_to @shop
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def review_params
      params.require(:review).permit(:shop_id, :user_id, :title, :content, :score)
    end
end
