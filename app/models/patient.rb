class Patient < ActiveRecord::Base
  include PersonConcern

  has_many :appointments, inverse_of: :patient
  has_many :doctors, through: :appointments
  has_and_belongs_to_many :ailments
  geocoded_by :address

  accepts_nested_attributes_for :ailments, allow_destroy: true, reject_if: :all_blank

  def address
    [street, city, state, zip, country].compact.join(', ')
  end

  def required_specialists
    Doctor.joins(:specialty)
          .where('specialties.description LIKE :diseases', diseases: disease_names.inject([]) { |arr, n| arr << "%#{n}%" }.join("','"))
  end

  private

  def disease_names
    Patient.first.ailments.map(&:name).flatten
  end
end

