class GroupsController < ApplicationController
  def new
  end

  def create
    Group.create(create_params)
    redirect_to controller: :messages, action: :index
  end

  private
    def create_params
      params.permit( :name)
    end
end
