class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    set_group
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: :index
    else
      set_group
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
