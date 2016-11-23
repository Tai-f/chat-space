class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
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
    group.update(group_params)
    redirect_to controller: :messages, action: :index
  end


  private
    def group_params
      params.require(:group).permit(:name)
    end

    def set_group
      @group = Group.find(params[:id])
    end

end
