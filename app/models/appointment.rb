# app/models/appointment.rb

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  
  validate :unique_time_slot_for_patient, on: :create
  def unique_time_slot_for_patient
    existing_appointment = Appointment.find_by(doctor_id: doctor_id, appointment_time: appointment_time)
    if existing_appointment && existing_appointment.patient_id == patient_id
      errors.add(:appointment_time, "has already been booked by the patient.")
    end
  end
end

