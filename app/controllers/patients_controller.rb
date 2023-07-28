class PatientsController < ApplicationController
  before_action :authenticate_patient!

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @appointments = @patient.appointments
  end

end
