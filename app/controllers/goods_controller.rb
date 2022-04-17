class GoodsController < ApplicationController
  before_action :set_comment, only: %i[create destroy]

  def create
    @good = Good.create(user_id: current_user.id, comment_id: @comment.id)
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, comment_id: @comment.id)
    good.destroy
  end

  private

  def set_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
  end
end
