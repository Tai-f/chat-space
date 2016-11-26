class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create
    Message.create(message_params)
  end

  
end
