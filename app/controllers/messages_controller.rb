class MessagesController < ApplicationController

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.new(message_params)
      if @message.save
        redirect_to @message.room
      else
        flash[:message] = @message
        flash[:error_messages] = @message.errors.full_messages
        redirect_back fallback_location: @message.room
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to @message.room
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :room_id, images: []).merge(user_id: current_user.id)
  end
end
