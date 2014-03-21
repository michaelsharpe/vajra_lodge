class MinutesController < ApplicationController
    def index
      @minutes = Minute.index(params, current_user)
      render stream: true
    end
  
    def show
      @minute = Minute.find(params[:id])
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

    def reviewed
      @minute = Minute.find(params[:id])
      if @minute.update_attribute(:reviewed, true)
        flash.now[:notice] = "Minutes for #{@minute.date} have been marked as reviewed"
        redirect_to "/minutes/#{params[:id]}"
      else
        flash.now[:alert] = "Failed to mark minutes for #{@minute.date} as reviewed"
        redirect_to "/minutes/#{params[:id]}"
      end
    end

    def not_reviewed
      @minute = Minute.find(params[:id])
      if @minute.update_attribute(:reviewed, false)
        flash.now[:notice] = "Minutes for #{@minute.date} have been marked as not reviewed"
        redirect_to "/minutes/#{params[:id]}"
      else
        flash.now[:alert] = "Failed to mark minutes for #{@minute.date} as not reviewed"
        redirect_to "/minutes/#{params[:id]}"
      end
    end
end