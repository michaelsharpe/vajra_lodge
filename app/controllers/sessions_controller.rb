class SessionsController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      if @user = login(params[:username], params[:password])
        redirect_to(:users, notice: "Login Successful")
      else
        flash.now[:alert] = "Login failed"
        render "new"
      end
    end
  
    def destroy
      logout
      redirect_to(root_url, notice: "You are now logged out.") 
    end

    private
    def session_params
      params.require(:user).permit(:username, :password)
    end
end
