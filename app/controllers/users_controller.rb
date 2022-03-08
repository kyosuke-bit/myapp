class UsersController < ApplicationController

  def show
    @user = User.find_by(name: params[:name])
    @profile = Profile.find_by(user_id: @user.id)
    @posts = Post.where(user_id: @user.id)

    @currentUserEntry = Entry.where(user_id: @current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == @current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id = u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to posts_path
    else
      redirect_to new_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def mypage
    @posts = Post.where(user_id: @current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
