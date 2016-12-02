class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:index, :create]
  def index
    @messages = @group.messages.order("id DESC")
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path, notice: "メッセージを保存しました"}
        format.json {render json: @message}
      end
    else
      @messages = @group.messages.order("id DESC")
      flash.now[:alert] = "メッセージが書かれていなかったため、保存できませんでした。"
      render :index
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
