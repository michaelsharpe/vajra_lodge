class SessionsController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      if @user = login(params[:username], params[:password])
        if @user.profile.disabled
          logout
          redirect_to root_url, alert: "Your account has been disabled.\n\nPlease speak with an admin"
        elsif @user.profile.roles.include? :Candidate
          logout
          redirect_to root_url
        else
          redirect_to(:feed, notice: "Login Successful")
        end
      else
        redirect_to root_url, alert: "Login failed"
      end
    end
  
    def destroy
      logout
      redirect_to(root_url, notice: "You are now logged out.")
    end
end
