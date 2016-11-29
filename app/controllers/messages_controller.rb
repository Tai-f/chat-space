class MessagesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_group, only: [:index, :create]
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: :index
    else
      flash.now[:alert] = "メッセージが書かれていなかったため、保存できませんでした。"
      render action: :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end


end
