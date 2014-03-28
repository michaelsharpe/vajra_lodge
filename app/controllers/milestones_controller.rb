class MilestonesController < ApplicationController
  before_filter :load_user
  before_filter :require_login

  def index
    if params[:category]
      @milestones = @user.milestones.where("category = ?", params[:category]).order(date: :desc)
    else
      @milestones = @user.milestones.order(date: :desc)
    end
  end

  def show
    @milestone = Milestone.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def load_user
    @user = User.find(params[:user_id])
  end
end