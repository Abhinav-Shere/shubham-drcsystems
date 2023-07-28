# app/models/availability.rb
class Availability < ApplicationRecord
  belongs_to :doctor
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :slot_interval, presence: true

  def slot_interval
    (end_time - start_time) / 1.hour
  end
end
