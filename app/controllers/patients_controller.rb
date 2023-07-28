class PatientsController < ApplicationController
  before_action :authenticate_patient!

  def index
    # Display a list of patients (if needed)
    @patients = Patient.all
  end

  def show
    # Display a specific patient's details and booked appointments
    @patient = Patient.find(params[:id])
    @appointments = @patient.appointments
  end

  # ... other actions as needed ...

end
