class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create
    Message.create(message_params)
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
