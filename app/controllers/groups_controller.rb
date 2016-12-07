class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      respond_to do |format|
        format.html {redirect_to group_messages_path(group_id: @group.id), notice: "グループを保存しました"}
        format.json {render json: @group}
      end

    else
      flash.now[:alert] = "保存できませんでした"
      render new_group_path
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
