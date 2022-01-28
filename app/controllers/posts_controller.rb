class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show edit update destroy]

  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new(flash[:post])
  end

  def create
    post = Post.new(post_params)
    if post.save
      flash[:notice] = "「#{post.title}」の質問を作成しました。"
      redirect_to post
    else
      redirect_to new_post_path, flash: {
        post: post,
        error_messages: post.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(post_id: @post.id)
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post, flash: { notice: "#{@post.title}の質問が更新されました  " }
  end

  def destroy
    @post.destroy
    redirect_to posts_path, flash: { notice: "#{@post.title}の質問が削除されました  " }
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, category_ids: [])
  end

  def set_target_post
    @post = Post.find(params[:id])
  end
end
