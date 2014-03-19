class Minute < ActiveRecord::Base
  def self.index(params, current_user)
    if params[:degree] && params[:reviewed] == "1"
      @minutes = Minute.where("degree = ? AND reviewed = ?", params[:degree], true)
    elsif params[:degree] && params[:reviewed] == "2"
      @minutes = Minute.where("degree = ? AND reviewed = ?", params[:degree], false)
    elsif params[:degree]
      @minutes = Minute.where("degree = ?", params[:degree]).order(date: :desc)
    elsif params[:reviewed] == "1"
      @minutes = Minute.where("reviewed = ? AND degree <= ?", true, current_user.degree).order(date: :desc)
    elsif params[:reviewed] == "2"
      @minutes = Minute.where("reviewed = ? AND degree <= ?", false, current_user.degree).order(date: :desc)
    else
      @minutes = Minute.where("degree <= ?", current_user.degree).order(date: :desc)
    end
  end
end
