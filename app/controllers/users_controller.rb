class UsersController < ApplicationController
    before_filter :require_login, :except => [:new, :create]

    def index
      @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new user_params
      if @user.save
        flash[:success] = "#{@user.username} has been created! Please take a few moments to fill out their profile."
        redirect_to "/users/#{@user.id}/profiles/new"
      else
        render "new"
      end
    end
  
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user

      if @user.update_attributes(user_params)
        render :show
      else
        flash.now[:alert] = "Could not update profile"
        render :edit
      end
    end
  
    def disable
      @user = User.find(params[:id])
      if @user.profile.update_attribute(:disabled, true)
        if current_user == @user
          logout
          redirect_to(root_url, notice: "Your account has been disabled.\nTo reactivate it, please speak with an admin.")
        else
          flash.now[:notice] = "#{@user.username} has been disabled"
          render :show
        end
      else
        flash.now[:alert] = "Failed to disable #{@user.username}."
        render :show
      end
    end

    def enable
      @user = User.find(params[:id])
      if @user.profile.update_attribute(:disabled, false)
        flash.now[:notice] = "#{@user.username} has been enabled"
        render :show
      else
        flash.now[:alert] = "Failed to enable #{@user.username}"
        render :show
      end
    end

    private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
