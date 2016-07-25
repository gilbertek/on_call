class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  validates :start_at, presence: true
  validate :start_at_3_days_later?, if: :new_record?

  def start_at_3_days_later?
    return true if start_at > 3.days.since(Time.current)
    errors.add(:base, "Appointments must be scheduled at least 3 days in the future.")
  end
end
