class AppointmentsController < ApplicationController
  before_action :authenticate_patient!

  def new
    @appointment = Appointment.new
  end
  def show 
    @appointment = Appointment.find(params[:id])
  end
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient = current_patient

    if @appointment.save
      redirect_to patient_path(current_patient), notice: "Appointment booked successfully."
    else
      render :new
    end
  end
  def index
    @appointments = current_patient.appointments.order(:appointment_time)
  end
  def destroy 
    @appointment = current_patient.appointments.find(params[:id])
    @appointment.destroy
    redirect_to root_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :appointment_time)
  end
end
