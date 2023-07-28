class AvailabilitiesController < ApplicationController
  before_action :authenticate_doctor!

  def new
    @availability = Availability.new
    @default_start_time = Time.now.change(hour: 10, min: 0, sec: 0)
    @default_end_time = Time.now.change(hour: 13, min: 0, sec: 0) + 1.hour
    @end_date = Time.now + 7.days
  end


  def create
    @availability = Availability.new(availability_params)
    @availability.doctor = current_doctor
    debugger
    if @availability.save
      redirect_to doctor_path(current_doctor), notice: "Availability set successfully."
    else
      render :new
    end
  end

  def index
    @availabilities = current_doctor.availabilities.order(:start_time)
  end

  private

  def availability_params
    params.require(:availability).permit(:start_time, :end_time, :slot_interval)
  end
end
