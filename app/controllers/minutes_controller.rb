class MinutesController < ApplicationController
    def index
      @minutes = Minute.index(params, current_user)
      render stream: true
    end
  
    def show
      @minute = Minute.find(params[:id])
    end
  
    def new
      @minute = Minute.new
    end
  
    def create
      @minute = Minute.create(minute_params)

      if @minute.save
        render "show"
      else
        render "new"
      end
    end
  
    def edit
      @minute = Minute.find(params[:id])
    end
  
    def update
      @minute = Minute.find(params[:id])

      if @minute.update_attributes(minute_params)
        render "show"
      else
        render "edit"
      end
    end
  
    def destroy
    end

    def reviewed
      @minute = Minute.find(params[:id])
      if @minute.update_attribute(:reviewed, true)
        flash.now[:notice] = "Minutes for #{@minute.date} have been marked as reviewed"
        redirect_to "/minutes##{params[:id]}"
      else
        flash.now[:alert] = "Failed to mark minutes for #{@minute.date} as reviewed"
        redirect_to "/minutes##{params[:id]}"
      end
    end

    def not_reviewed
      @minute = Minute.find(params[:id])
      if @minute.update_attribute(:reviewed, false)
        flash.now[:notice] = "Minutes for #{@minute.date} have been marked as not reviewed"
        redirect_to "/minutes##{params[:id]}"
      else
        flash.now[:alert] = "Failed to mark minutes for #{@minute.date} as not reviewed"
        redirect_to "/minutes##{params[:id]}"
      end
    end

    private
    def minute_params
      params.require(:minute).permit(:degree, :date, :open, :close, :content, :reviewed)
    end
end
