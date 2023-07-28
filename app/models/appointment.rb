# app/models/appointment.rb

class Appointment < ApplicationRecord
  enum status: { pending: 0, accepted: 1, rejected: 2 }
  belongs_to :doctor
  belongs_to :patient
  
end

