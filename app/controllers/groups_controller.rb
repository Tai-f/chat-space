class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    group = Group.create(create_params)
    if group.present?
      redirect_to controller: :messages, action: :index
    else
      render action: :new
    end
  end

  private
    def create_params
      params.require(:group).permit(:name)
    end
end
