class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:index, :create]
  before_action :set_messages, only: [:index]
  def index
    respond_to do |format|
      format.html
      format.json {render json: @messages}
    end
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path, notice: "メッセージを保存しました"}
        format.json {render json: @message}
      end
    else
      set_messages
      flash.now[:alert] = "メッセージが書かれていなかったため、保存できませんでした。"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image, :image_cache).merge(group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages.order("id DESC")
  end

end
