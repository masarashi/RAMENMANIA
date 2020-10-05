class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  before_action :authenticate_user!, only: [:show, :myshops]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def myshops
    @user = current_user
    @shops = @user.shops
  end
end
