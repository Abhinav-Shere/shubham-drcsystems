class DoctorsController < ApplicationController
  before_action :authenticate_doctor!

  def index
    # Display a list of doctors
    @doctors = Doctor.all
  end

  def show
    # Display a specific doctor's details and available appointments
    @doctor = Doctor.find(params[:id])
    @availabilities = @doctor.availabilities.where("start_time >= ?", Time.now)
  end

  # ... other actions as needed ...

end
