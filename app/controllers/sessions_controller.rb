class SessionsController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      if @user = login(params[:username], params[:password])
        redirect_to(:feed, notice: "Login Successful")
      else
        @user = User.new
        flash.now[:alert] = "Login failed"
        render "new"
      end
    end
  
    def destroy
      logout
      redirect_to(root_url, notice: "You are now logged out.") 
    end
end
