class Admin::TimeOfDaysController < ApplicationController

  def index
    @time_of_day = TimeOfDay.new
    @time_of_days = TimeOfDay.all
  end

  def create
    time_of_day = TimeOfDay.new(time_of_day_params)
    time_of_day.save
    redirect_to admin_time_of_days_path
  end

  def edit
    @time_of_day = TimeOfDay.find(params[:id])
  end

  def update
    @time_of_day = TimeOfDay.find(params[:id])
    if @time_of_day.update(time_of_day_params)
      redirect_to admin_time_of_days_path
    else
      render :edit
    end
  end

  def destroy
    time_of_day = TimeOfDay.find(params[:id])
    time_of_day.destroy
    redirect_to admin_time_of_days_path
  end


  private

  def time_of_day_params
    params.require(:time_of_day).permit(:name)
  end

end
