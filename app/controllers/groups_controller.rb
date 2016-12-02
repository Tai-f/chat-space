class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      move_to_index
    else
      render action: :new
    end
  end

  def edit
    set_group
  end

  def update
    set_group
    if @group.update(group_params)
      move_to_index
    else
      render action: :edit
    end
  end



  private
    def group_params
      params.require(:group).permit(:name, user_ids:[])
    end

    def set_group
      @group = Group.find(params[:id])
    end

    def move_to_index
      redirect_to root_path
    end

end
