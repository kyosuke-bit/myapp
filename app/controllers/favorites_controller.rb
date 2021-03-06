class FavoritesController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @favorite = Favorite.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    favorite.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
