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
        auto_login(@user)
        flash[:success] = "Welcome, #{@user.username}!"
        redirect_to @user, notice: "User successfully created"
      else
        render "new"
      end
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end

    private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
