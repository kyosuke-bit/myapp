class RoomsController < ApplicationController

  def create
    @room = Room.create
    Entry.create(room_id: @room.id, user_id: @current_user.id)
    Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"

    # @room = Room.new(room_params)
    # @room.save
    # redirect_to room_messages_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(room_id: @room.id, user_id: @current_user.id).present?
      @messages = @room.messages.all
      @message = Message.new
      @entries = @room.entries

      @user = (@entries.where(user_id: @current_user.id))[0]
      @another_user = (@entries.where.not(user_id: @current_user.id))[0]
    else
      # redirect_to(fallback_location: link_to userpage_path(@user.name))
      redirect_back(fallback_location: root_path)
    end
  end

  private

  # def room_params
  #   params.permit(user_ids: [])
  # end
end
