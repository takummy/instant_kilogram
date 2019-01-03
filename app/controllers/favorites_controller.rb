class FavoritesController < ApplicationController
  def index
    @favorite_pictures = current_user.favorite_pictures.page(params[:page])
                                     .order_by_created_at
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_path
  end

  def destroy
    favorite = Favorite.find_by(picture_id: params[:id])
    favorite.destroy
    redirect_to pictures_path
  end
end