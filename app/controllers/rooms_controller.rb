class RoomsController < ApplicationController

  def create
    @room = Room.create
    Entry.create(room_id: @room.id, user_id: @current_user.id)
    Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(room_id: @room.id, user_id: @current_user.id).present?
      @messages = @room.messages.all
      @entries = @room.entries
      @user = (@entries.where(user_id: @current_user.id))[0]
      @another_user = (@entries.where.not(user_id: @current_user.id))[0]

      @message = Message.new(room_id: @room.id)
    else
      redirect_back(fallback_location: root_path)
    end

  end
end
