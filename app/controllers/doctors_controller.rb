class DoctorsController < ApplicationController
  before_action :authenticate_doctor!

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
    @availabilities = @doctor.availabilities.where("start_time >= ?", Time.now)
  end
end
