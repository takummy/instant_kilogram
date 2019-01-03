class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).order_by_created_at
  end

  def show
    @user = User.find(params[:id])
  end
end