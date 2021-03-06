class PicturesController < ApplicationController
  include PicturesHelper
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :correct_owner, only: [:edit, :update, :destroy]

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      PostInfoMailer.notification_mail(@picture.user).deliver
      flash[:info] = '投稿完了'
      redirect_to pictures_path
    else
      render :new
    end
  end

  def index
    @favorites = current_user.favorite_pictures.pluck(:id)
    @pictures = Picture.page(params[:page]).order_by_created_at
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      flash[:success] = '編集しました'
      redirect_to pictures_path
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:info] = '削除しました'
    redirect_to pictures_path
  end

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

  def correct_owner
    unless correct_owner?
      flash[:danger] = '権限がありません'
      redirect_to root_path
    end
  end
end