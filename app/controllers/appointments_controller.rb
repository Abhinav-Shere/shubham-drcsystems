class AppointmentsController < ApplicationController
  before_action :authenticate_patient!

  def new
    # Display a form to allow the patient to book an appointment
    @appointment = Appointment.new
  end
  def show 
    @appointment = Appointment.find(params[:id])
  end
  def create
    # Save the patient's appointment
    @appointment = Appointment.new(appointment_params)
    @appointment.patient = current_patient

    if @appointment.save
      redirect_to patient_path(current_patient.id), notice: "Appointment booked successfully."
    else
      render :new
    end
  end

  def index
    # Display the list of appointments for the current patient
    @appointments = current_patient.appointments.order(:appointment_time)
  end

  # ... other actions as needed ...

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :appointment_time)
  end
end
