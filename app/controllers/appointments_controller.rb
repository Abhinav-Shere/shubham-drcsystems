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
    else
      render :new
    end
  end
  def accept
    @appointment = Appointment.find(params[:id])
    @appointment.accepted!
    redirect_to doctor_path(current_doctor), notice: 'Appointment accepted!'
  end

  def reject
    @appointment = Appointment.find(params[:id])
    @appointment.rejected!
    redirect_to doctor_path(current_doctor), notice: 'Appointment rejected!'
  end

  def index
    @appointments = current_patient.appointments.order(:appointment_time)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :appointment_time)
  end
end
