class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to controller: :messages, action: :index
    else
      render action: :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(update_params)
    redirect_to controller: :messages, action: :index
  end


  private
    def create_params
      params.require(:group).permit(:name)
    end

    def update_params
      params.require(:group).permit(:name)
    end
end
