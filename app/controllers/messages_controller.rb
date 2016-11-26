class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end


end
