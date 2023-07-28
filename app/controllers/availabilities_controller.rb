class AvailabilitiesController < ApplicationController
  before_action :authenticate_doctor!

  def new
    debugger
    @availability = Availability.new
    @default_start_time = Time.now.change(hour: 10, min: 0, sec: 0) # Default start time at 10:00 AM
    @default_end_time = Time.now.change(hour: 13, min: 0, sec: 0)   # Default end time at 1:00 PM
  end

  def create
    # Save the doctor's availability
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
    # Display the list of availabilities for the current doctor
    @availabilities = current_doctor.availabilities.order(:start_time)
  end

  # ... other actions as needed ...

  private

  def availability_params
    params.require(:availability).permit(:start_time, :end_time, :slot_interval)
  end
end
