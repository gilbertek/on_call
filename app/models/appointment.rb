class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  validates :doctor, presence: true
  validates :patient, presence: true
  validates :start_at, presence: true
  validate :start_at_3_days_later?, if: :new_record?

  def start_at_3_days_later?
    return true if start_at > Time.now + 3.days
    errors.add(:date, "Appointments must be scheduled at least 3 days in the future.")
  end
end
