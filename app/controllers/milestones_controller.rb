class MilestonesController < ApplicationController
  before_filter :load_user
  before_filter :require_login

  def index
    if params[:category]
      @milestones = @user.milestones.where("category = ?", params[:category]).order(date: :desc)
    else
      @milestones = @user.milestones.order(date: :desc)
    end
    @milestone = @user.milestones.new
  end

  def show
    @milestone = Milestone.find(params[:id])
  end

  def new
    @milestone = @user.milestones.new
  end

  def create
    @milestone = @user.milestones.build(milestone_params)
    @milestone.user_id = @user.id
    if @milestone.save
      redirect_to("/users/#{@user.id}/milestones", notice: "New milestone created for #{@user.username}")
    else
      flash.now[:alert] = "Unable to save milestone"
      render "new"
    end
  end

  def edit
    @milestone = Milestone.find(params[:id])
  end

  def update
    @milestone = Milestone.find(params[:id])
    if @milestone.update_attributes(milestone_params)
      redirect_to("/users/#{@user.id}/milestones", notice: "Updated.")
    else
      flash.now[:alert] = "Edit failed"
      render "edit"
    end
  end

  private
  def milestone_params
    params.require(:milestone).permit(:category, :event, :date, :location, :description)
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end