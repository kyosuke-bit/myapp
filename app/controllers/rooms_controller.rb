class RoomsController < ApplicationController

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: @current_user.id)
    @entry2 = Entry.create(entry_params)
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(room_id: @room.id, user_id: @current_user.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      # redirect_to(fallback_location: link_to userpage_path(@user.name))
      redirect_back(fallback_location: root_path)
    end

    @user = User.find_by(name: params[:name])
  end

  private

  def entry_params
    params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
