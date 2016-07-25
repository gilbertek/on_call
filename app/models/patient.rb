class Patient < ActiveRecord::Base
  include PersonConcern

  has_many :appointments, inverse_of: :patient
  has_many :doctors, through: :appointments
  has_and_belongs_to_many :ailments
  geocoded_by :address

  accepts_nested_attributes_for :ailments, allow_destroy: true, reject_if: :all_blank

  def address
    [street, city, state, country].compact.join(', ')
  end
end
