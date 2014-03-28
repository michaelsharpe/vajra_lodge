class ProfilesController < ApplicationController
    before_filter :load_user
    before_filter :require_login

    def index
    end
  
    def show
    end
  
    def new
      @profile = @user.build_profile
    end
  
    def create
      @profile = @user.build_profile(profile_params)
      if @profile.save
        redirect_to "/users/#{@user.id}"
      else
        render "new"
      end
    end
  
    def edit
      @profile = @user.profile
    end
  
    def update
      @profile = @user.profile
      if @profile.update_attributes(profile_params)
        flash.now[:success] = "Successfully updated profile"
        redirect_to "/users/#{@user.id}"
      else
        flash.now[:alert] = "Was unable to save changes"
        render "edit"
      end
    end
  
    def destroy
    end

    def admin
      @user.profile.update_attribute(:admin, !@user.admin?) if can? :make_admin, @user
      redirect_to "/users/#{@user.id}"
    end

    private
    def profile_params
      params.require(:profile).permit(:degree, :admin, :disabled, :email, :address, :phone, :bio, :roles => [])
    end

    def load_user
      @user = User.find(params[:user_id])
    end
end
